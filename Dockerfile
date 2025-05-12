# Dockerfile

# Utiliser l’image officielle PHP avec FPM
FROM php:8.2-fpm

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    libzip-dev \
    libpq-dev \
    default-mysql-client \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd zip

# Copier Composer depuis l’image officielle
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Définir le dossier de travail de l'application
WORKDIR /var/www

# Copier uniquement les fichiers nécessaires pour installer les dépendances
COPY composer.json composer.lock ./

# Installer les dépendances Laravel sans les scripts et sans les dev
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Ensuite, copier le reste de l’application
COPY . .

# S'assurer que les répertoires de cache existent et sont accessibles
RUN mkdir -p storage/framework/{cache,sessions,views} bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Nettoyer les caches artisan au build
RUN php artisan config:clear && \
    php artisan route:clear && \
    php artisan view:clear

# Exposer le port sur lequel Laravel servira l'application
EXPOSE 8000

# Lancer le serveur Laravel intégré
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]

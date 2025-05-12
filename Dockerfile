# Utilise l'image officielle PHP avec FPM
FROM php:8.2-fpm

# Installe les dépendances nécessaires
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

# Installe Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Définit le répertoire de travail
WORKDIR /var/www

# Copie uniquement les fichiers nécessaires pour installer les dépendances
COPY composer.json composer.lock ./

# Installe les dépendances Laravel sans les packages de dev
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Copie tout le reste de l'application
COPY . .

# Donne les bons droits aux fichiers
RUN chmod -R 755 /var/www && chown -R www-data:www-data /var/www

# Nettoie les caches Laravel
RUN php artisan config:clear && \
    php artisan route:clear && \
    php artisan view:clear

# Expose le port Laravel
EXPOSE 8000

# Démarre le serveur Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]

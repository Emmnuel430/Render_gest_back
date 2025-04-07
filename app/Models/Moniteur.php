<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// Classe représentant le modèle Moniteur
class Moniteur extends Model
{
    use HasFactory; // Utilisation du trait HasFactory pour la génération des données factices

    protected $table = 'moniteurs'; // Nom de la table associée au modèle

    // Champs pouvant être remplis en masse
    protected $fillable = [
        'nom',        // Nom du moniteur
        'prenom',     // Prénom du moniteur
        'specialite', // Spécialité du moniteur
    ];

    // Relation entre Moniteur et Etudiant (un moniteur peut avoir plusieurs étudiants)
    public function etudiant()
    {
        return $this->hasMany(Etudiant::class, 'idMoniteur'); // Clé étrangère 'idMoniteur'
    }
}

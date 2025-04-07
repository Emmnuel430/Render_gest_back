<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Progression extends Model
{
    use HasFactory;

    // Nom de la table explicitement défini
    protected $table = 'progression';

    // Champs pouvant être remplis en masse
    protected $fillable = [
        'idEtudiant', // Référence à l'identifiant de l'étudiant
        'etape',      // Étape actuelle de la progression
    ];

    // Définition de la relation avec le modèle Etudiant
    public function etudiant()
    {
        // Une progression appartient à un étudiant
        return $this->belongsTo(Etudiant::class, 'idEtudiant');
    }
}

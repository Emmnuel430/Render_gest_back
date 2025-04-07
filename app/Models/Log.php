<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    // Définition des attributs pouvant être assignés en masse
    protected $fillable = [
        'idUser',           // Identifiant de l'utilisateur associé au log
        'action',           // Action effectuée (exemple : création, suppression)
        'table_concernee',  // Nom de la table concernée par l'action
        'details',          // Détails supplémentaires sur l'action
        'created_at',       // Date et heure de création du log
    ];

    // Désactive la gestion automatique des timestamps par Eloquent
    public $timestamps = false;

    // Définition de la relation entre le log et l'utilisateur
    public function user()
    {
        // Un log appartient à un utilisateur (relation "belongsTo")
        return $this->belongsTo(User::class, 'idUser');
    }
}

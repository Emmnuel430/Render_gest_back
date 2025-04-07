<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * Les attributs assignables en masse.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'nom',
        'prenom',
        'pseudo',
        'password',
        'role',
    ];

    /**
     * Les attributs à cacher pour les tableaux.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public $timestamps = false;

    /**
     * Les attributs avec type spécifié.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'role' => 'boolean', // Cast du rôle en booléen
    ];

    /* public function resultat()
    {
        return $this->hasMany(Resultat::class, 'idUser');
    } */
}

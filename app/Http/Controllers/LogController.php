<?php

namespace App\Http\Controllers;

use App\Models\Log;
use Illuminate\Http\Request;

class LogController extends Controller
{
    public function index()
    {
        // Retourne les logs avec les informations des utilisateurs associés
        return Log::with('user')->latest()->paginate(999999999999);
    }

    public function latestLogs()
    {
        // Retourne les 5 derniers logs avec les informations des utilisateurs associés
        return Log::with('user')->latest()->take(5)->get();
    }
}

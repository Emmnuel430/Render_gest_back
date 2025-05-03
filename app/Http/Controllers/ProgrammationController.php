<?php

namespace App\Http\Controllers;

use App\Models\Programmation;
use \App\Models\Progression;
use App\Models\Log;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProgrammationController extends Controller
{
    // Méthode pour lister les programmations
    public function listeProg()
    {
        // Récupère toutes les programmations avec les informations de l'utilisateur associé
        $programmations = Programmation::with('user')->get();

        // Retourne une réponse JSON avec le statut et les programmations
        return response()->json([
            'status' => 'success',
            'programmations' => $programmations
        ]);
    }

    // Méthode pour ajouter une nouvelle programmation
    public function addProg(Request $request)
    {
        // Valide les données envoyées dans la requête
        $validated = $request->validate([
            'date_prog' => 'required|date', // La date de programmation est obligatoire et doit être une date valide
            'type' => 'required|in:code,conduite', // Le type doit être soit "code" soit "conduite"
            'fichier_pdf' => 'required|file|mimes:pdf|max:8192', // Le fichier doit être un PDF de taille maximale 8 Mo
            'idUser' => 'required|exists:users,id', // L'utilisateur doit exister dans la table "users"
            'nom_fichier' => 'required|string|max:255', // Le nom du fichier est obligatoire et doit être une chaîne de caractères
            'etudiants' => 'required|array', // Les étudiants doivent être fournis sous forme de tableau
            'etudiants.*' => 'exists:etudiant,id', // Chaque étudiant doit exister dans la table "etudiants"
        ]);

        // Stockage du fichier PDF avec un nom personnalisé
        try {
            // Remplace les espaces dans le nom du fichier par des underscores
            $filename = str_replace(' ', '_', $validated['nom_fichier']);
            // Enregistre le fichier dans le dossier "programmations" du stockage public
            $path = $request->file('fichier_pdf')->storeAs('programmations', $filename, 'public');

            // Vérifie si le chemin d'enregistrement est valide
            if (!$path) {
                throw new \Exception("Erreur lors de l'enregistrement du fichier.");
            }
        } catch (\Exception $e) {
            // Retourne une réponse JSON en cas d'erreur lors du téléchargement
            return response()->json([
                'status' => 'error',
                'message' => 'Échec du téléchargement du fichier PDF : ' . $e->getMessage(),
            ], 500);
        }

        // Création de la programmation dans la base de données
        $programmation = Programmation::create([
            'date_prog' => $validated['date_prog'], // Date de la programmation
            'type' => $validated['type'], // Type de la programmation
            'fichier_pdf' => $path, // Chemin du fichier PDF
            'idUser' => $validated['idUser'], // ID de l'utilisateur associé
            'created_at' => now(), // Date de création
        ]);

        // ✅ RÉCUPÉRATION DES ÉTUDIANTS
        $etudiantsIds = $validated['etudiants'];

        // ✅ DÉTERMINER LA NOUVELLE ÉTAPE
        $nouvelleEtape = $validated['type'] === 'code'
            ? 'programmé_pour_le_code'
            : 'programmé_pour_la_conduite';

        // ✅ MISE À JOUR DES PROGRESSIONS
        foreach ($etudiantsIds as $idEtudiant) {
            $progression = Progression::where('idEtudiant', $idEtudiant)->first();
            if ($progression) {
                $progression->update(['etape' => $nouvelleEtape]);
            }
        }

        $user = User::find($validated['idUser']);
        // Enregistrement d'un log pour suivre l'action
        Log::create([
            'idUser' => $validated['idUser'], // ID de l'utilisateur ayant effectué l'action
            'user_nom' => $user->nom,
            'user_prenom' => $user->prenom,
            'user_pseudo' => $user->pseudo,
            'user_doc' => $user->created_at,
            'action' => 'add', // Action effectuée (ajout)
            'table_concernee' => 'programmations', // Table concernée par l'action
            'details' => "Programmation ajoutée : {$validated['date_prog']} ({$validated['type']}).", // Détails de l'action
        ]);

        // Retourne une réponse JSON avec le statut, un message de succès, les détails de la programmation et l'URL du fichier
        return response()->json([
            'status' => 'success',
            'message' => 'Programmation ajoutée avec succès.',
            'programmation' => $programmation,
            'file_url' => asset("storage/$path"), // Génère l'URL complète du fichier
        ], 201);
    }
}

<?php

namespace App\Observers;

use App\Models\Progression;
use App\Models\RappelImp;

class ProgressionObserver
{
    /**
     * Surveiller l'évolution de la progression
     *
     * @param \App\Models\Progression $progression
     * @return void
     */
    public function updated(Progression $progression)
    {
        // Si l'étudiant atteint l'examen de conduite, clôturer le rappel de formation prolongée
        if ($progression->etape === 'examen_de_conduite') {
            RappelImp::where('idUser', $progression->etudiant->idUser)
                ->where('type', 'formation')
                ->where('statut', 0)
                ->update(['statut' => 1]);
        }
    }
}

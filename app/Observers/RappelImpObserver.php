<?php
namespace App\Observers;

use App\Models\RappelImp;
use App\Models\Programmation;
use App\Models\Progression;

class RappelImpObserver
{

    // 🟢 Surveiller l’ajout d’un examen
    public function created(Programmation $programmation)
    {
        // 4️⃣ Quand la date d’un examen est passée, on clôture le rappel
        RappelImp::where('idUser', $programmation->idUser)
            ->where('type', 'examen')
            ->whereDate('date_rappel', '>=', value: now()->toDateString())
            ->where('statut', 0)
            ->update(['statut' => 1]);
    }

    // 🟢 Surveiller la suppression d’un examen
    public function deleted(Programmation $programmation)
    {
        // 4️⃣ Quand la date d’un examen est passée, on clôture le rappel
        RappelImp::where('idUser', $programmation->idUser)
            ->where('type', 'examen')
            ->whereDate('date_rappel', operator: '<=', value: now()->toDateString())
            ->where('statut', 0)
            ->update(['statut' => 1]);
    }
    // 🟢 Surveiller l’évolution de la progression
    public function updated(Progression $progression)
    {
        // 5️⃣ Si l'étudiant atteint l'examen de conduite, clôturer le rappel de formation prolongée
        if ($progression->etape === 'examen_de_conduite') {
            RappelImp::where('idUser', $progression->etudiant->idUser)
                ->where('type', 'formation')
                ->where('statut', 0)
                ->update(['statut' => 1]);
        }
    }
}

<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
// ----------
use App\Models\Etudiant;
use App\Models\Programmation;
use App\Models\Resultat;
use App\Models\Progression;
// ----------
use App\Observers\RappelImpObserver;
use App\Observers\ResultatObserver;
use App\Observers\EtudiantObserver;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Etudiant::observe(EtudiantObserver::class);
        Programmation::observe(RappelImpObserver::class);
        Progression::observe(RappelImpObserver::class);
        Resultat::observe(ResultatObserver::class);

    }

}

<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/



Route::resource('Alumnos', 'AlumnosController');

//Route::Controller('Alumnos','alumnosController');
Route::Controller('Profesor','profesorController');
Route::Controller('Asignaturas','AsignaturasController');
Route::Controller('Administrador','administradorController');
Route::Controller('Archivo','ArchivosController');
Route::Controller("/login","loginController");
Route::Controller("/","loginController");
Route::get('logout', 'LoginController@getLogout');

Route::get('/',function()
{
    return View::make('index');
});
Route::get('logout',function()
{
	Auth::logout();
    return Redirect::to('/');
});


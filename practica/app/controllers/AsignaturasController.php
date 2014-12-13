<?php

class AsignaturasController extends \BaseController {

	protected $layout='layouts.asignaturasMaster';

	public function get_primero()
	{
		return View::make('Asignaturas.primero');
	}

	public function get_segundo()
	{
		return View::make('Asignaturas.segundo');
	}

	public function get_tercero()
	{
		return View::make('Asignaturas.tercero');
	}
	
	public function get_cuarto()
	{
		return View::make('Asignaturas.cuarto');
	}

	public function get_quinto()
	{
		return View::make('Asignaturas.quinto');
	}

	public function get_sexto()
	{
		return View::make('Asignaturas.sexto');
	}

}

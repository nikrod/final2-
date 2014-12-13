|<?php

class AlumnosController extends \BaseController {

	protected $layout='layouts.master';


	public function Index()
	{
		
		$usuario=Auth::User();
		return View::make('Alumnos.indexAlumno');
	}

	public function get_asignaturas()
	{
		$nombre = Asignatura::all();
		return View::make('Alumnos.asignaturas')->with('nombre',$nombre);
	}

	public function post_asignatura()
	{

	}
	public function show()
	{
		$nombre = Asignatura::all();
		return View::make('Alumnos.asignaturas')->with('nombre',$nombre);
	}
	public function create()
	{
		return View::make('Alumnos.add');
	}

	public function store()
	{
			$userdata = array(
            'nombres' => Input::get('nombres'),
            'apellidos' => Input::get('apellidos'),
            'rut' => Input::get('rut'),
            
        );
            $rut = \App\RutUtils::rut($userdata['rut']);

        $rules = array(
            'rut' => 'Required',
            'nombres' => 'Required|alpha',
            'apellidos' => 'Required|alpha',
            
            );

        $validator= Validator::make($userdata,$rules);

        if ($validator->passes())
            {
      			
                $Alumnox=new Alumno;
                $Alumnox->nombres=$userdata["nombres"];
                $Alumnox->apellidos=$userdata["apellidos"];
                $Alumnox->rut=$rut;
                $Alumnox->carrera_fk=1;
                $Alumnox->save();
               
                return Redirect::to('Profesor')->with('status', 'ok_create');
            }

            return Redirect::to('Profesor')->withErrors($validator);
	}



}

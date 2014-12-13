<?php

class profesorController extends Controller {
	
	protected $layout='layouts.asignaturasMaster';

	public function getIndex()
	{
        
        return View::make('Profesor.indexProfe');
	}


    public function get_asignaturas()
    {
        $nombre = Asignatura::all();
        return View::make('Profesor.asignaturas')->with('nombre',$nombre);
    }


	public function post_add()
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
                $Alumnox->rut=$userdata["rut"];
                $Alumnox->carrera_fk=1;
                $Alumnox->save();
               
                return view::make('Profesor.indexProfe')->with('status','ok_create');
            }

            return view::make('Profesor.indexProfe')->withErrors($validator);
	}


		
	

}

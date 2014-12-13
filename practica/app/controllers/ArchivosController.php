<?php

class ArchivosController extends \BaseController {

	protected function get_index()
	{
		return View::make('Archivo.index');
	}

	public function get_ver()
	{
		$archi=Archivo::all();
		$asigna=Asignatura::all();
		return View::make('Archivo.ver')->with('archivo',$archi)->with('asigna',$asigna);
	}

        public function get_download($name)
        {
            $filename = storage_path() . '/uploads/' . $name;
            return Response::download($filename); // TODO: Pegarse una validada, para ver si el fichero existe
        }

	public function post_ver()
	{

	}


	public function get_add()
	{
		return View::make('Archivo.add');
	}

	public function post_add($ramo)
	{
		
		$path= storage_path() . '/uploads/';
		$file=Input::file('archivo');
		$Input=Input::All();
		$archivo=$file->getClientOriginalName();
		$upload=$file->move($path,$archivo);

		    $rules = array(
            'rut' => 'Required',
            'nombres' => 'Required|alpha',
            'apellidos' => 'Required|alpha',
            
            );

		if($upload)
		{
		$archivox=new Archivo;
		$archivox->nombre=$Input{'nombre'};
		$archivox->ruta=($archivo);
		$archivox->asignaturas_fk = $ramo;
		$archivox->save();
		$msg = 'ok_create';
		
		}
		else
		{
			$msg = 'ok_no_create';
		}
		return Redirect::to('Profesor')->with('status', $msg);
		
	}
	

}

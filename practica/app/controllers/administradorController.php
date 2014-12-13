<?php

class administradorController extends Controller {

	public function getIndex()
	{
		return View::make('indexAdministrador');
	}

	public function get_add()
	{
		return View::make('Administrador.add');
	}

	public function post_add()
	{
		$Input=Input::All();
		$Admi=new Administrador;
		$Admi->Rut_Adm=$Input{"Rut_Adm"};
		$Admi->Clave=$Input{"Clave"};
		$Admi->Nombre=$Input{"Nombre"};
		$Admi->Apellido=$Input{"Apellido"};
		$Admi->save();
		//return Redirect::to('/Administrador');
	}
}

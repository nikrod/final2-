<?php

class loginController extends BaseController {


	protected $layout='layouts.master';

	public function getIndex()
	{
		return $this->layout->content = View::make('login.login');
	}

	public function post_index()
	{
        	$userdata = array(
            'id' => Input::get('rut'),
            'rut' => Input::get('rut'),
            'password' => Input::get('password')
        );
            $rut = \App\RutUtils::rut($userdata['rut']);

        $rules = array(
            'rut' => 'Required',
            'password' => 'Required'
        );

        if (Auth::attempt($userdata)) {
            $user = \App\Modelo\Usuario::whereRut($rut)->first();
               if($user->tipousuario()=='alumno')
                   return $this->layout->content = View::make('Alumnos.indexAlumno');
               else
                    return $this->layout->content = View::make("Profesor.indexProfe");
        }
        else
        {
        	//return "no hola";
        	//return View::make("Alumnos.add");
            return Redirect::to('login')->with('login_errors', true);
        }
        

	}

     public function getLogout() {
        // Log out
        Auth::logout();
        // Redirect to homepage
        return Redirect::to('/')->with('exito', 'Se ha deslogueado exitosamente');
    }




}

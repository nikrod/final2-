<?php

class testController extends BaseController {


protected $layout='layouts.master';

public function getIndex()
{
	return $this->layout->content = View::make('test.login');
}

public function showAdministrador()
{
	return $this->layout->content = View::make('test.administrador');
}
public function showProfesor()
{
	return $this->layout->content = View::make('test.profesor');
}

public function getLogin()
{
	return $this->layout->content = View::make('test.login');
}

}


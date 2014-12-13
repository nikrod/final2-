@if(Auth::check())
@extends('layouts.master')

@section('titulo')
    UTEM - Bienvenido
@stop 


@section('content')

<div class="panel panel-default" style="margin-top: 40px;">
                        <div class="panel-heading">
                            

                            <h2><b>Bienvenido Alumno </b><i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i></h2> 

                        </div>
                        <div class="panel-body">                  
                  
                        <div class="row">
                          <div class="col-sm-3">
                                          
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    
                        <li>
                      <a class="list-group-item active">
    Apuntes <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
  </a>
</li>
</li>
                 
<a href="{{URL::to('/Alumnos/asignaturas')}}" class="list-group-item">Asignaturas</a>
       
</li>
                            <!-- /.nav-second-level -->
                        
                       


</div>

</div>
 <div class="col-sm-9">
   <p>                    
                          <b>Aquí podrá visualizar pautas y pruebas de sus asignaturas.</b>                                
                        </p>
                        <div class="bs-docs-section">                
<div class="panel panel-default">
<div class="panel-body">
  <div class="form-group">
  <div class="jumbotron">
      <h2>Panel de Administración de Evaluaciones</h2>
      <p>Estudiantes Ingeniería Civil en Computación Mención Informática</p>
      <p><a class="btn btn-primary" href="{{URL::to('/Alumnos/asignaturas')}}" role="button">Ver Asignaturas</a></p>
    </div>
  </div>

                    
</div>
</div>
</div>

                    
</div>
 </div>
                            </div>

                        </div>
                    

                 

@stop
@endif
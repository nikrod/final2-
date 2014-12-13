@if(Auth::check())
@extends('layouts.asignaturasMaster')

@section('titulo')
    UTEM - Bienvenido
@stop 

@section('content')

<div class="panel panel-default" style="margin-top: 40px;">
                        <div class="panel-heading">
                            
                            <h2><b>Bienvenido Profesor</b><i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i></h2> 

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
<li>
   <a href="{{URL::to('/Profesor/asignaturas')}}" class="list-group-item">Asignaturas</a>   


    </li>                       
                        
                       

</div>
  




</div>

 <div class="col-sm-9">

  <?php $status=Session::get('status'); ?>
  @if($status == 'ok_create')
<div class="alert alert-success fade in"><button class="close" data-dismiss="alert" type="button">×</button>
<i class="fa fa-check-square"></i> El fichero fue subido con éxito.</div> 
@endif

 <?php $status=Session::get('status'); ?>
  @if($status == 'ok_no_create')
<div class="alert alert-danger fade in"><button class="close" data-dismiss="alert" type="button">×</button>
<i class="fa fa-check-square"></i> El fichero no fue subido con éxito.</div> 
@endif


  @if($errors->has())
  @foreach($errors->all() as $error)
  <!--<div>{{$error}}</div>-->
  @endforeach
  
  <div class="alert alert-danger fade in"><button class="close" data-dismiss="alert" type="button">×</button>
<i class="fa fa-exclamation-triangle"></i> Han faltado campos o ha ingresado datos erroneos</div> 
@endif
   <p>                          
                              <b> Este es el panel de administración de su sitio web, en el cual
                                  usted podrá agregar archivos.</b>                                 
  </p>
<div class="bs-docs-section">                
<div class="panel panel-default">
<div class="panel-body">             
<div class="jumbotron">
      <h2>Panel de Administración de Evaluaciones</h2>
      <p>Profesores Ingeniería Civil en Computación Mención Informática</p>
      <p><a class="btn btn-primary" href="{{URL::to('/Profesor/asignaturas')}}" role="button">Ver Asignaturas</a></p>
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
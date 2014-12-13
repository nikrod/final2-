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
                                     
                <div class="sidebar-nav navbar-collapse" id="target" style="overflow: scroll; height:400px; padding-right:0">
                    <ul class="nav" id="side-menu">
                    
                        <li>
                      <a class="list-group-item active">
    Asignaturas <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
  </a>

      @foreach($nombre as $ra)
   
      <a href="{{URL::to('/Archivo/ver/?id=' .$ra->codigo )}}" class="list-group-item"><p><font size=2><center>{{$ra->nombre}}</center></font></p></a>
      
        @endforeach

    </li>                        <!-- /.nav-second-level -->
                        
                       

</div>
     <div id="log"></div>





</div>
 <div class="col-sm-9">
   <p>                    
                          <b>Aquí podrá visualizar pautas y pruebas de sus asignaturas.</b>                                
                        </p>
                        <div class="bs-docs-section">                
<div class="panel panel-default">
<div class="panel-body">
  <div class="form-group">
    <div class="list-group">
<p>Seleccione la Asignatura para ver su contenido.</p>   
   
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
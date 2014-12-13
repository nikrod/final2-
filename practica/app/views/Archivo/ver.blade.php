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
    Asignaturas <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
  </a>
</li>
</li><p><font size=2><center>

@foreach($asigna as $vo)

        @if($vo->codigo==$_GET['id'])
          <?php  $nombre=$vo->nombre;  ?>
        @endif
@endforeach





<a href="{{URL::to('/Alumnos/asignaturas')}}" class="list-group-item">Asignatura:<p><font size=2><center> <?php echo $nombre ?></p></font></center></a>
       
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
 <?php  echo $nombre ?>

    <?php $_GET['id']; ?> 
   
       @foreach($archivo as $vo)

        @if($vo->asignaturas_fk==$_GET['id'])


        <div class="list-group-item">

      Nombre de Archivo: {{$vo->nombre}}, {{$vo->ruta}}<br><a href="{{URL::to('/Archivo/download/'. $vo->ruta)}} "><button type="submit" class="btn btn-primary">Descargar <i class="glyphicon glyphicon-save" aria-hidden="true"></i></button></a>
       </div>

     
      

@endif
        @endforeach


   
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

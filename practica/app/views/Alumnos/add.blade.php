@if(Auth::check())
@extends('layouts.master')

@section('titulo')
    UTEM - Alumno
@stop   



@section('content')
<center>
<div id="wrapper">
      <div class="container" style="width: 400px";>
    <br>
    <br>
    <br>

<div class="panel panel-default" style="margin-top: 40px;">
<div class="panel-heading">
<h2 class="form-signin-heading" style="font-size:25px;">Agregar Alumno</h2>
</div>
<div class="panel-body">  
    <form class="form-signin" method="post" action="{{ URL::route('Alumnos.store') }}">
    <input name="nombres" type="text" class="form-control" placeholder="Nombres" required>
    <input name="apellidos" type="text" class="form-control" placeholder="Apellidos" required>
    <input name="rut" type="text" class="form-control" placeholder="Rut" id="rut" required>
   
    <button type="submit" class="btn btn-primary">Subir Archivo <i class="glyphicon glyphicon-open" aria-hidden="true"></i>
    </form>
      <script src="http://localhost:8000/js/jquery.Rut.min.js"></script>
      <script type="text/javascript">
      jQuery(document).ready(function($) {
        $("#rut").Rut();
       });
      </script>
      </div>
    </div>
    </div>
    </div>
</center>
@stop
@endif
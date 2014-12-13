@if(Auth::check())
@extends('layouts.master')

@section('titulo')
    UTEM - Archivo
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
<h2 class="form-signin-heading" style="font-size:25px;">Agregar Archivo</h2>
</div>
<div class="panel-body">  
 <?php $_GET['asig']; ?> 
  <form role="form" action="{{URL::to('/Archivo/add/'.$_GET['asig'])}}" enctype="multipart/form-data" method="post" id="formulario">
  <div class="form-group">
    <label for="exampleInputEmail1">Descripcion</label>
    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Ingrese una descripción " name="nombre" required>
    
    

  </div>
<div class="form-group">
<input type="file" class="form-control" id="exampleInputEmail1" placeholder="Ingrese archivo" name="archivo" required>
</div> 

              <button type="submit" class="btn btn-primary">Subir Archivo <i class="glyphicon glyphicon-open" aria-hidden="true"></i>
      </form>

      </div>
    </div>
    </div>
    </div>
</center>

@stop

@endif
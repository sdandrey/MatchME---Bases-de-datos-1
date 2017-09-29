<?php
	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);

	$nombre=$_POST["nombre"];
	$apellido=$_POST["apellido"];
	$url="Busquedas.php?";
	if($nombre != ""){
		$url=$url."nombre=".$nombre."&";
	}
	if($apellido != ""){
		$url=$url."apellido=".$apellido;
	}
	echo"<script>window.location='$url'</script>";
?>
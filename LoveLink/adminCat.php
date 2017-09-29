<?php
	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);
	$usuario = $_SESSION['user'];
	$stid = oci_parse($conn, "begin :ret :=le.esAdmin('$usuario'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$admin = $r;
	if($admin == 1){
		$pag="administrador.php";
		echo"<script>window.location='$pag'</script>";
	}else{
		$error="Debe ser administrador para ingresar a esta seccion";
		echo"<script>alert('$error')</script>";
		$pagina = "Busquedas.php";
		echo"<script>window.location='$pagina';</script>";
	}
	OCILogoff($conn);
?>
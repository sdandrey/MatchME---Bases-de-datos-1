<?php
	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);
	$usuario = $_SESSION['user'];
	$stid = oci_parse($conn, "begin :ret :=le.esAdmin('$usuario'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$admin = $r;
	if($admin == 1){
		$pagina="Busquedas.php?id=2";
		echo "<script type='text/javascript'>window.location='$pagina';</script>";
	}else{
		$pagina="Busquedas.php";
		echo "<script type='text/javascript'>window.location='$pagina';</script>";
		$error="Debe ser admin para añadir eventos";
		echo"<script>alert('$error')</script>";
	}
	OCILogoff($conn);
?>
<?php
	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);

	$personID = (int)$_GET["id"];
	$myID = $_SESSION['person_id'];

	$stid = oci_parse($conn, "begin :ret :=le.hayWink('$personID','$myID'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
	oci_execute($stid);
	$hayWink = $r;
	if($hayWink == 0){
		$stid = oci_parse($conn, "begin le.insert_Wink('$myID','$personID'); end;");
		oci_execute($stid);
	}else{
		$stid = oci_parse($conn, "begin le.delWink('$personID','$myID'); end;");
		oci_execute($stid);
	}
	$pagina="abrirPerfil.php?id=".$personID;
	echo "<script type='text/javascript'>window.location='$pagina';</script>";
	ocilogoff($conn); // close database connection
?>
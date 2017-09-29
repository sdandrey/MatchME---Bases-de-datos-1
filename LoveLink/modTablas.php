<?php
	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);

	//ELIMINAR
	if(isset($_POST["eli"."Contextura"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_BODY_TYPE('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=contextura";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Bebedor"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_DRINKER('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=bebedor";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Educacion"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_EDUCATION_LEVEL('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=educacion";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Ejercicio"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_EXERCISE('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ejercicio";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Ojos"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_EYECOLOR('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ojos";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Pelo"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_HAIRCOLOR('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=pelo";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Hobbie"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_HOBBIE('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=hobbie";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Lenguaje"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_LANGUAGE('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=lenguaje";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Estado"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_MARITALSTATUS('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=estado";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Ocupacion"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_OCUPATION_ELM('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ocupacion";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Religion"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_RELIGION('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=religion";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Piel"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_SKINCOLOR('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=piel";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."EjerFrec"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_EXERCISE_FREC('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ejerFrec";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["eli"."Salario"])){
		$idEliminar=$_GET["id"];
		$stid = oci_parse($conn, "begin le.DELETE_SALARY('$idEliminar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=salario";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["Actualizar"])){
		$idActualizar=$_GET["id"];
		$valueActualizar=$_POST["value"];
		echo"<script>alert('$valueActualizar'+'$idActualizar');</script>";
		$stid = oci_parse($conn, "begin le.updateParameter('$idActualizar','$valueActualizar'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=parametros";
	    echo"<script>window.location='$pagina';</script>";
	}

	//AGREGAR
	else if(isset($_POST["agregar"."Contextura"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_BODY_TYPE('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=contextura";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Bebedor"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_DRINKER('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=bebedor";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Educacion"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_EDUCATION_LEVEL('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=educacion";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Ejercicio"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.insert_Excercise('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ejercicio";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Ojos"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_EYE_COLOR('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ojos";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Pelo"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_HAIR_COLOR('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=pelo";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Hobbie"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_HOBBIE('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=hobbie";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Lenguaje"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_LANGUAGE('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=lenguaje";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Estado"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_MARITAL_STATUS('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=estado";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Ocupacion"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_OCUPATION('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ocupacion";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Religion"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_RELIGION('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=religion";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Piel"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_SKIN_COLOR('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=piel";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."EjerFrec"])){
		$nuevo=$_POST["nuevo"];
		$stid = oci_parse($conn, "begin le.INSERT_EXERCISE_FREQUENCY('$nuevo'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=ejerFrec";
	    echo"<script>window.location='$pagina';</script>";
	}else if(isset($_POST["agregar"."Salario"])){
		$desde=$_POST["desde"];
		$hasta=$_POST["hasta"];
		$stid = oci_parse($conn, "begin le.INSERT_SALARY_RANGE('$desde','$hasta'); end;");
	    oci_execute($stid);
	    $pagina="administrador.php?opcion=salario";
	    echo"<script>window.location='$pagina';</script>";
	}
	OCILogoff($conn);
?>
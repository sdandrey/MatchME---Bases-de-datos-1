<?php
	include ("conexion.php");

	$conn = OCILogon($user, $pass, $db);
	$error="";
	if (!$conn){
		echo "Conexion es invalida" . var_dump ( OCIError() );
		die();
	}
	$id_person=$_SESSION['person_id'];
	$nombre = $_POST["nombre"];
	$apellido = $_POST["apellido"];
	$fecha = $_POST["fecha"];
	$genero = $_POST["genero"];
	$frase = $_POST["frase"];
	$peso = $_POST["peso"];
	$altura = $_POST["altura"];
	$ciudad = $_POST["ciudad"];
	$fumador = "n";
	if(isset($_POST["fumador"])){
		$fumador= "s";
	}
	$ngustaMascotas = "n";
	if(isset($_POST["gustaMascotas"])){
		$ngustaMascotas = "s";
	}
	$ntieneMascotas = "n";
	if(isset($_POST["tieneMascotas"])){
		$ntieneMascotas = "s";
	}
	$nquiereHijos = "n";
	if(isset($_POST["quiereHijos"])){
		$nquiereHijos = "s";
	}
	$nmarried = "n";
	if(isset($_POST["married"])){
		$nmarried = "s";
	}
	$ncantHijos = (int)$_POST["cantHijos"];
	$pelo = $_POST["pelo"];
	$contextura = $_POST["contextura"];
	$educacion = $_POST["educacion"];
	$estado = $_POST["estado"];
	$religion =$_POST["religion"];
	$salario = $_POST["salario"];

	$piel = $_POST["piel"];
	$bebedor = $_POST["bebedor"];
	$ojos = $_POST["ojos"];
	$frecEjercicio = $_POST["ejercicio"];
	$ocupacion = $_POST["ocupacion"];

	$stid = oci_parse($conn, "begin :ret :=le.Get_LifeStyle_Id('$id_person'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.delete_lifeStyle('$id'); end;");
	    oci_execute($stid);
	}
    $stid = oci_parse($conn, "begin :ret :=le.Insert_LifeStile('$ngustaMascotas','$ntieneMascotas','$nquiereHijos','$ncantHijos','$fumador'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id2 = $r;
	$stid = oci_parse($conn, "begin le.Insert_lifeStyleXPerson('$id2','$id_person'); end;");
	oci_execute($stid);

	$stid = oci_parse($conn, "begin le.del_drinker_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_Drinker_Id('$bebedor'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.Insert_Drinker_X_Person('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_ocupation_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_Ocupation_Id('$ocupacion'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_Ocupation_X_Person('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_skin_color_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_Skin_color_Id('$piel'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_person_x_skinColor('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_Exer_fre_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_Exercise_frecuency_Id('$frecEjercicio'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_Exercise_frec_X_Person('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_eye_col_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_Eye_color_Id('$ojos'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_person_x_eyeColor('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_religion_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_religion_Id('$religion'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_person_x_religion('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_marital_status_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_estado_Id('$estado'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_person_x_maritalStatus('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_salary_range_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_salaryRange_Id('$salario'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_Salary_range_X_Person('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_hair_col_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_pelo_Id('$pelo'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_person_x_hair('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_body_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_contextura_Id('$contextura'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_person_x_bodyType('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin le.del_educationlv_x_person('$id_person'); end;");
    oci_execute($stid);
    $stid = oci_parse($conn, "begin :ret :=le.Get_educacion_Id('$educacion'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$id = $r;
	if($id != -1){
		$stid = oci_parse($conn, "begin le.insert_Education_X_Person('$id','$id_person'); end;");
		oci_execute($stid);
	}

	$stid = oci_parse($conn, "begin :ret :=le.getIDCiudad('$ciudad'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$ciudad_id = $r;
	$stid = oci_parse($conn, "begin le.update_Person('$id_person','$nombre','$apellido','$fecha','$genero','$frase','$peso','$altura','$ciudad_id','$nmarried'); end;");
	oci_execute($stid);

	$stid = oci_parse($conn, "begin le.del_language_x_person('$id_person'); end;");
    oci_execute($stid);

    if(!empty($_POST['check_idioma'])) {
	    foreach($_POST['check_idioma'] as $check) {
	    	$stid = oci_parse($conn, "begin :ret :=le.Get_Language_Id('$check'); end;");
			oci_bind_by_name($stid, ':ret', $r, 200);
		    oci_execute($stid);
			$id_idioma = $r;
			$stid = oci_parse($conn, "begin le.insert_person_x_lenguaje('$id_idioma','$id_person'); end;");
			oci_execute($stid);
	    }
	}

	$stid = oci_parse($conn, "begin le.del_exercise_x_person('$id_person'); end;");
    oci_execute($stid);

    if(!empty($_POST['check_deporte'])) {
	    foreach($_POST['check_deporte'] as $check) {
	    	$stid = oci_parse($conn, "begin :ret :=le.Get_Exercise_Id('$check'); end;");
			oci_bind_by_name($stid, ':ret', $r, 200);
		    oci_execute($stid);
			$id_idioma = $r;
			$stid = oci_parse($conn, "begin le.insert_person_x_exercise('$id_idioma','$id_person'); end;");
			oci_execute($stid);
	    }
	}

	$stid = oci_parse($conn, "begin le.del_hobbie_x_person('$id_person'); end;");
    oci_execute($stid);

    if(!empty($_POST['check_hobbie'])) {
	    foreach($_POST['check_hobbie'] as $check) {
	    	$stid = oci_parse($conn, "begin :ret :=le.Get_Hobbie_Id('$check'); end;");
			oci_bind_by_name($stid, ':ret', $r, 200);
		    oci_execute($stid);
			$id_idioma = $r;
			$stid = oci_parse($conn, "begin le.insert_person_x_hobbie('$id_idioma','$id_person'); end;");
			oci_execute($stid);
	    }
	}
	$pagina="abrirMiPerfil.php";
	echo "<script type='text/javascript'>window.location='$pagina';</script>";
	OCILogoff($conn);
?>
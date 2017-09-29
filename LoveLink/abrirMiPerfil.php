<?php
	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);
	$pagina = file_get_contents("Perfil.html");
	echo $pagina;

	$personID=$_SESSION['person_id'];

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_info_pers_uno('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data1); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_info_pers_dos('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data2); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_info_pers_tres('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data3); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	$nnombre = $data1['PERSON_NAME'][0];
	$napellido = $data1['PERSON_LASTNAME'][0];
	$nfecha = $data1['PERSON_BDAY'][0];
	
	$stid = oci_parse($conn, "begin :ret :=le.signo_zodiacal('$nfecha'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
	$nsigno = $r;

	$stid = oci_parse($conn, "begin :ret :=le.getEdad('$personID'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
	oci_execute($stid);
	$nedad = $r;

	$ngenero = $data1['PERSON_GENRE'][0];
	$npais = $data2['COUNTRY_NAME'][0];
	$nciudad = $data2['CITY_NAME'][0];
	$nfrase = $data1['PERSON_PHRASE'][0];
	$nfumador = $data1['SMOKER'][0];
	if($nfumador == "s"){
		$nfumador="si";
	}else{
		$nfumador="no";
	}
	$nbebedor = $data1['DRINKER_TYPE'][0];
	$nejercicio = $data1['EXERCISE_FRECUENCY_NAME'][0];
	$ncantHijos = $data1['CANT_CHILDREN'][0];
	$nquiereHijos = $data1['WANTS_CHILDREN'][0];
	if($nquiereHijos == "s"){
		$nquiereHijos="si";
	}else{
		$nquiereHijos="no";
	}
	$nocupacion = $data1['OCUPATION_NAME'][0];
	$nsalario = $data1['SAL_FROM'][0] . "-" . $data1['SAL_TO'][0];
	$ngustaMascotas = $data1['LIKES_PETS'][0];
	if($ngustaMascotas=="s"){
		$ngustaMascotas="si";
	}else{
		$ngustaMascotas="no";
	}
	$ntieneMascotas = $data1['HAS_PETS'][0];
	if($ntieneMascotas=="s"){
		$ntieneMascotas="si";
	}else{
		$ntieneMascotas="no";
	}
	$naltura = $data1['PERSON_HEIGHT'][0];
	$npiel = $data3['SKIN_COLOR_NAME'][0];
	$nojos = $data3['EYE_COLOR_NAME'][0];
	$npelo = $data3['HAIR_COLOR_NAME'][0];
	$npeso = $data1['PERSON_WEIGHT'][0];
	$ncontextura = $data3['BODY_TYPE_NAME'][0];
	$neducacion = $data3['EDUCATION_LEVEL_NAME'][0];
	$nestado = $data1['MARITAL_STATUS_NAME'][0];
	$nreligion = $data1['RELIGION_NAME'][0];
	$nmarried = $data1['MARRIED'][0];
	if($nmarried=="s"){
		$nmarried="si";
	}else{
		$nmarried="no";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin GET_HOBBIES_X_PERSON('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$tipo="hobbies";
	for($i=0;$i<count($data['HOBBIE_NAME']);$i++){
		$valor=$data['HOBBIE_NAME'][$i];
		echo "<script type='text/javascript'>putUL('$valor','$tipo');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin GET_LANGUAGE_X_PERSON('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$tipo="idiomas";
	for($i=0;$i<count($data['LANGUAGE_NAME']);$i++){
		$valor=$data['LANGUAGE_NAME'][$i];
		echo "<script type='text/javascript'>putUL('$valor','$tipo');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin GET_EJERCICIOS_DE_PERSONA('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$tipo="deportes";
	for($i=0;$i<count($data['EXERCISE_NAME']);$i++){
		$valor=$data['EXERCISE_NAME'][$i];
		echo "<script type='text/javascript'>putUL('$valor','$tipo');</script>";
	}

	echo "<script type='text/javascript'>modificarInfo('$nnombre','$napellido','$nfecha','$nsigno','$nedad','$ngenero','$npais','$nciudad','$nfrase','$nfumador','$nbebedor','$nejercicio','$ncantHijos','$nquiereHijos','$nocupacion','$nsalario','$ngustaMascotas','$ntieneMascotas','$naltura','$npiel','$nojos','$npelo','$npeso','$ncontextura','$neducacion','$nestado','$nreligion','$nmarried');</script>";

	for($i=1;$i<6;$i++){
		$stid = oci_parse($conn, "begin :ret :=le.existeImagen('$i','$personID'); end;");
	    oci_bind_by_name($stid, ':ret', $r, 200);
	    oci_execute($stid);
	    $existe = $r;
	    if($existe != 0){
			$query = 'SELECT BLOBDATA FROM BTAB WHERE FK_PERSON_ID = :MYBLOBID AND IMGPOS = :POS';
			$stmt = oci_parse ($conn, $query);
			oci_bind_by_name($stmt, ':MYBLOBID', $personID);
			oci_bind_by_name($stmt, ':POS', $i);
		 	oci_execute($stmt, OCI_DEFAULT);
			$arr = oci_fetch_assoc($stmt);
			$result = $arr['BLOBDATA']->load();
			$source="data:image/jpeg;base64,".base64_encode( $result );
			$nombre="img".$i;
			echo "<script type='text/javascript'>modImg('$source','$nombre');</script>";
		}
	}

	ocilogoff($conn); // close database connection

?>'
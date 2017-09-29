<?php
	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);

	$pagina = file_get_contents("CambiarInfo.html");
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
	$nsigno = "se calcula";
	$nedad = "se calcula";
	$ngenero = $data1['PERSON_GENRE'][0];
	$npais = $data2['COUNTRY_NAME'][0];
	$nciudad = $data2['CITY_NAME'][0];
	$nfrase = $data1['PERSON_PHRASE'][0];
	$nfumador = $data1['SMOKER'][0];
	$nbebedor = $data1['DRINKER_TYPE'][0];
	$nejercicio = $data1['EXERCISE_FRECUENCY_NAME'][0];
	$ncantHijos = $data1['CANT_CHILDREN'][0];
	$nquiereHijos = $data1['WANTS_CHILDREN'][0];
	$nocupacion = $data1['OCUPATION_NAME'][0];
	$nsalario = $data1['SAL_FROM'][0] . "-" . $data1['SAL_TO'][0];
	$ngustaMascotas = $data1['LIKES_PETS'][0];
	$ntieneMascotas = $data1['HAS_PETS'][0];
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

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_all_Country(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor

	echo "<script type='text/javascript'>reiniciaArray();</script>"; 
	for($i=0;$i<count($data['COUNTRY_ID']);$i++){
		echo "<script type='text/javascript'>nuevoLugar('$i');</script>"; 
		$pais_id=$data['COUNTRY_ID'][$i];
		$num=0;
		$valor=$data['COUNTRY_NAME'][$i];
		echo "<script type='text/javascript'>anadirPais('$i','$num','$valor');</script>";
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Cities_in_Country('$pais_id',:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data2); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($k=0;$k<count($data2['CITY_NAME']);$k++){
			$k2=$k+1;
			$valor=$data2['CITY_NAME'][$k];
			echo "<script type='text/javascript'>anadirLugar('$i','$k2','$valor');</script>";
		}
		echo "<script type='text/javascript'>elegirPais();</script>"; 
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Exercise_frecuency_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['EXERCISE_FRECUENCY_NAME']);$i++){
		$valor=$data['EXERCISE_FRECUENCY_NAME'][$i];
		echo "<script type='text/javascript'>anadirExerFrec('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Ocupation_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['OCUPATION_NAME']);$i++){
		$valor=$data['OCUPATION_NAME'][$i];
		echo "<script type='text/javascript'>anadirOCU('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Skin_color_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['SKIN_COLOR_NAME']);$i++){
		$valor=$data['SKIN_COLOR_NAME'][$i];
		echo "<script type='text/javascript'>anadirPIEL('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Eye_color_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['EYE_COLOR_NAME']);$i++){
		$valor=$data['EYE_COLOR_NAME'][$i];
		echo "<script type='text/javascript'>anadirOJOS('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Hair_color_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['HAIR_COLOR_NAME']);$i++){
		$valor=$data['HAIR_COLOR_NAME'][$i];
		echo "<script type='text/javascript'>anadirPELO('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Body_type_Categories(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['BODY_TYPE_NAME']);$i++){
		$valor=$data['BODY_TYPE_NAME'][$i];
		echo "<script type='text/javascript'>anadirCONTEX('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Education_level_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['EDUCATION_LEVEL_NAME']);$i++){
		$valor=$data['EDUCATION_LEVEL_NAME'][$i];
		echo "<script type='text/javascript'>anadirEDU('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Marital_status_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['MARITAL_STATUS_NAME']);$i++){
		$valor=$data['MARITAL_STATUS_NAME'][$i];
		echo "<script type='text/javascript'>anadirEST('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Drinker_Categories(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	
	for($i=0;$i<count($data['DRINKER_TYPE']);$i++){
		$valor=$data['DRINKER_TYPE'][$i];
		echo "<script type='text/javascript'>anadirBEB('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Salary_range_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	for($i=0;$i<count($data['SAL_FROM']);$i++){
		$valor=$data['SAL_FROM'][$i] . "-" . $data['SAL_TO'][$i];
		echo "<script type='text/javascript'>anadirSAL('$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Language_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$array=array();
	$cantidad=0;
	$tipo="idioma";
	for($i=0;$i<count($data['LANGUAGE_NAME']);$i++){
		$cantidad=$i%4;
		$valor=$data['LANGUAGE_NAME'][$i];
		$array[$cantidad]=$valor;
		if($cantidad == 3){
			echo "<script type='text/javascript'>putCheckBox('$array[0]','$array[1]','$array[2]','$array[3]','$tipo');</script>";
		}
	}
	if(count($data['LANGUAGE_NAME']) == 0){
		$cantidad=-1;
	}
	if($cantidad < 1){
		$array[1] = "none";
	}
	if($cantidad < 2){
		$array[2] = "none";
	}
	if($cantidad < 3 && $cantidad != -1){
			$array[3] = "none";
			echo "<script type='text/javascript'>putCheckBox('$array[0]','$array[1]','$array[2]','$array[3]','$tipo');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Exercise_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$array=array();
	$cantidad=0;
	$tipo="deporte";
	for($i=0;$i<count($data['EXERCISE_NAME']);$i++){
		$cantidad=$i%4;
		$valor=$data['EXERCISE_NAME'][$i];
		$array[$cantidad]=$valor;
		if($cantidad == 3){
			echo "<script type='text/javascript'>putCheckBox('$array[0]','$array[1]','$array[2]','$array[3]','$tipo');</script>";
		}
	}
	if(count($data['EXERCISE_NAME']) == 0){
		$cantidad=-1;
	}
	if($cantidad < 1){
		$array[1] = "none";
	}
	if($cantidad < 2){
		$array[2] = "none";
	}
	if($cantidad < 3 && $cantidad != -1){
			$array[3] = "none";
			echo "<script type='text/javascript'>putCheckBox('$array[0]','$array[1]','$array[2]','$array[3]','$tipo');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin get_Hobbie_Cat(:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$array=array();
	$cantidad=0;
	$tipo="hobbie";
	for($i=0;$i<count($data['HOBBIE_NAME']);$i++){
		$cantidad=$i%4;
		$valor=$data['HOBBIE_NAME'][$i];
		$array[$cantidad]=$valor;
		if($cantidad == 3){
			echo "<script type='text/javascript'>putCheckBox('$array[0]','$array[1]','$array[2]','$array[3]','$tipo');</script>";
		}
	}
	if(count($data['HOBBIE_NAME']) == 0){
		$cantidad=-1;
	}
	if($cantidad < 1){
		$array[1] = "none";
	}
	if($cantidad < 2){
		$array[2] = "none";
	}
	if($cantidad < 3 && $cantidad != -1){
			$array[3] = "none";
			echo "<script type='text/javascript'>putCheckBox('$array[0]','$array[1]','$array[2]','$array[3]','$tipo');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin GET_LANGUAGE_X_PERSON('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$tipo = "idioma";
	for($i=0;$i<count($data['LANGUAGE_NAME']);$i++){
		$valor=$data['LANGUAGE_NAME'][$i] . "-" . $data['SAL_TO'][$i];
		echo "<script type='text/javascript'>selectCheckBox('$tipo','$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin GET_EJERCICIOS_DE_PERSONA('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$tipo = "deporte";
	for($i=0;$i<count($data['EXERCISE_NAME']);$i++){
		$valor=$data['EXERCISE_NAME'][$i];
		echo "<script type='text/javascript'>selectCheckBox('$tipo','$valor');</script>";
	}

	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin GET_HOBBIES_X_PERSON('$personID',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$tipo = "hobbie";
	for($i=0;$i<count($data['HOBBIE_NAME']);$i++){
		$valor=$data['HOBBIE_NAME'][$i];
		echo "<script type='text/javascript'>selectCheckBox('$tipo','$valor');</script>";
	}

	echo "<script type='text/javascript'>colocarInfoInicial('$nnombre','$napellido','$nfecha','$nsigno','$nedad','$ngenero','$nfrase','$nfumador','$nbebedor','$nejercicio','$ncantHijos','$nquiereHijos','$nocupacion','$nsalario','$ngustaMascotas','$ntieneMascotas','$naltura','$npiel','$nojos','$npelo','$npeso','$ncontextura','$neducacion','$nestado','$nreligion','$nmarried');</script>";
	OCILogoff($conn);
?>
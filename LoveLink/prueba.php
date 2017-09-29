<?php
	include ("conexion.php");
	if(isset($_POST["Buscar"])){
		$var1 = $_POST["Busqueda"];
	}else{
		$var1="";
	}
	//$nombreTabla="Marital_status";
	$nombreTabla=$var1;

	$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin GET_ALLINFORMACION_X_PERSON(1,:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection
	//var_dump($data); // show content fo $data variable

	//foreach($data as $equipo=>$jugador){
//		echo "El " . $equipo . " es " . $jugador;
//	}

	/*foreach($data as $col){
		echo $col;
		foreach($col as $item){
			echo $item;
			echo ($item !==null ? htmlentities($item, ENT_QUOTES): "");

		}
	}
	*/
	echo "hola";
	echo $_SESSION['person_id'];

?>
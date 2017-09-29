<?php

/**
 * This example shows settings to use when sending via Google's Gmail servers.
 */

//SMTP needs accurate times, and the PHP time zone MUST be set
//This should be done in your php.ini, but this is how to do it if you don't have access to that

date_default_timezone_set('Etc/UTC');

require 'PHPMailerAutoload.php';

//Create a new PHPMailer instance
$mail = new PHPMailer;

//Tell PHPMailer to use SMTP
$mail->isSMTP();

//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages


//Ask for HTML-friendly debug output


//Set the hostname of the mail server
$mail->Host = 'smtp.gmail.com';
// use
// $mail->Host = gethostbyname('smtp.gmail.com');
// if your network does not support SMTP over IPv6

//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;

//Set the encryption system to use - ssl (deprecated) or tls
$mail->SMTPSecure = 'tls';

//Whether to use SMTP authentication
$mail->SMTPAuth = true;

//Username to use for SMTP authentication - use full email address for gmail
$mail->Username = "andreysanchezcr@gmail.com";

//Password to use for SMTP authentication
$mail->Password = "+9d9542ab93+";

//Set who the message is to be sent from
$mail->setFrom('andreysanchezcr@example.com', 'Evento');

//Set an alternative reply-to address
$mail->addReplyTo('replyto@example.com', 'First Last');

//Set who the message is to be sent to


//Set the subject line


//Read an HTML message body from an external file, convert referenced images to embedded,


	include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);
	if (!$conn){
		echo "Conexion es invalida" . var_dump ( OCIError() );
		die();
	}

	$ciudad = $_POST["ciudad"];
	$pais = $_POST["pais"];
	$hora = $_POST["hora"];
	$hora2 = $_POST["hora2"];
	if($hora2 == "pm"){
		$hora= intval($hora)+12;
	}
	$dia = $_POST["dia"];
	$mes = $_POST["mes"];
	$nombre = $_POST["name"];

	$mail->Subject = 'Hay un evento cerca tuyo!!<br>  Evento: '.$nombre;

	$descripcion = $_POST["description"];
	$mensaje='Descripción del evento: '.$descripcion."<br>Hora: ".$hora.$hora2."<br>Fecha: ".$dia."-".$mes."-".date("Y")."<br>Ciudad: ".$ciudad."<br>Pais: ".$pais."<br><b>Te esperamos!!</b>";
	$mail->msgHTML($mensaje );

	$stid = oci_parse($conn, "begin :ret :=le.getIDPais('$pais'); end;");

	oci_bind_by_name($stid, ':ret', $r, 200);
	oci_execute($stid);
	$idPais = $r;
	$stid = oci_parse($conn, "begin :ret :=le.Get_City_Id_bynombre('$ciudad','$idPais'); end;");
	oci_bind_by_name($stid, ':ret', $r, 200);
	oci_execute($stid);
	$id_ciudad = $r;

	$fecha = "2015 " . $mes . " " . $dia;

	$stid = oci_parse($conn, "begin le.registrarEvento('$nombre','$descripcion','$hora','$id_ciudad','$fecha'); end;");
	oci_execute($stid);


	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin getIDsPersonas('$id_ciudad',:curs) ; end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	$mensaje=count($data['PERSON_ID']);
	for($i=0;$i<count($data['PERSON_ID']);$i++){
		$valor=$data['PERSON_ID'][$i];

		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin getEmailXPerson('$valor',:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data2); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		$mensaje=count($data2['E_MAIL_ADDRESS']);
		for($i=0;$i<count($data2['E_MAIL_ADDRESS']);$i++){
			$valor2=$data2['E_MAIL_ADDRESS'][$i];
			$mail->addAddress($valor2, $valor2);
		}
	}



	$mail->send();












	$pagina="Busquedas.php";
	echo "<script type='text/javascript'>window.location='$pagina';</script>";

	OCILogoff($conn);
?>
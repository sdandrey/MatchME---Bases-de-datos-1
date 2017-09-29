<?php
	include ("conexion.php");

	$conn = OCILogon($user, $pass, $db);
	$error="";
	if (!$conn){
		echo "Conexion es invalida" . var_dump ( OCIError() );
		die();
	}
	$id_usuario;
	if(isset($_POST["boton_login"])){
		$var1 = $_POST["user"];
		$var2 = $_POST["pass"];

		$stid = oci_parse($conn, "begin :ret :=le.compararUsuario('$var1','$var2'); end;");
		oci_bind_by_name($stid, ':ret', $r, 200);
	    oci_execute($stid);
		$id_usuario = $r;
		if($id_usuario == -1){
			$error="Contraseña o usuario incorrecto";
		}
		if($error == ""){
			$_SESSION["sessionAbierta"]=1;
			$_SESSION['person_id']=$id_usuario;
			$_SESSION['user']=$var1;
			$pagina="Busquedas.php";
			echo "<script type='text/javascript'>window.location='$pagina';</script>";
			echo "<script type='text/javascript'>open('$var1');</script>";    //o quitamos 'var1' y ponemos sin comillas lo que enviamos :D
		}else{
			echo "<script type='text/javascript'>window.history.back();</script>";
			echo"<script>alert('$error')</script>";
		}
	}else if(isset($_POST["boton_registrar"])){
		$user = $_POST["user"];
		$pass = $_POST["pass"];
		$pass2 = $_POST["pass2"];
		$name = $_POST["name"];
		$last_name = $_POST["last_name"];
		$mail = $_POST["mail"];

		$stid = oci_parse($conn, "begin :ret :=le.existeUsuario('$user'); end;");
		oci_bind_by_name($stid, ':ret', $r, 200);
	    oci_execute($stid);
		$existeUsuario = $r;

		if( $pass == $pass2){
			if($existeUsuario == 0){
				$stid = oci_parse($conn, "begin le.insert_Person('$user','$name','$last_name','$mail','$pass'); end;");
		    	oci_execute($stid);

		    	$stid = oci_parse($conn, "begin :ret :=le.compararUsuario('$user','$pass'); end;");
				oci_bind_by_name($stid, ':ret', $r, 200);
			    oci_execute($stid);
				$id_usuario = $r;
				if($id_usuario == -1){
					$error="Ha ocurrido un problema, favor volver a intentar";
				}else{
					$_SESSION['user']=$user;
					$_SESSION['person_id']=$id_usuario;

					//mandando el correo


				date_default_timezone_set('Etc/UTC');

				require 'PHPMailerAutoload.php';

				//Create a new PHPMailer instance
				$mail1 = new PHPMailer;

				//Tell PHPMailer to use SMTP
				$mail1->isSMTP();

				//Enable SMTP debugging
				// 0 = off (for production use)
				// 1 = client messages
				// 2 = client and server messages


				//Ask for HTML-friendly debug output


				//Set the hostname of the mail server
				$mail1->Host = 'smtp.gmail.com';
				// use
				// $mail->Host = gethostbyname('smtp.gmail.com');
				// if your network does not support SMTP over IPv6

				//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
				$mail1->Port = 587;

				//Set the encryption system to use - ssl (deprecated) or tls
				$mail1->SMTPSecure = 'tls';

				//Whether to use SMTP authentication
				$mail1->SMTPAuth = true;

				//Username to use for SMTP authentication - use full email address for gmail
				$mail1->Username = "andreysanchezcr@gmail.com";

				//Password to use for SMTP authentication
				$mail1->Password = "+9d9542ab93+";

				//Set who the message is to be sent from
				$mail1->setFrom('andreysanchezcr@example.com', 'andreysanchezcr@example.com');

				//Set an alternative reply-to address
				$mail1->addReplyTo('replyto@example.com', 'First Last');

				$mensaje='Bienvenido a LoveLink, un lugar para encontrar pareja<br>
				. Te recomenadmos a rellenar tu perfil para encontrar a tu pareja ideal ';
				$mail1->msgHTML($mensaje );
				$mail1->Subject = 'Gracias por registrarte ';

				//Set who the message is to be sent to

				$mail1->addAddress($mail, $mail);
				$mail1->send();





				}
			}else{
				$error="Este usuario ya se encuentra registrado";
			}
		}else{
			$error="Las contraseñas no coinciden";
		}
		if($error == ""){
			$_SESSION["sessionAbierta"]=1;
			$_SESSION['person_id']=$id_usuario;
			$pagina="Busquedas.php";
			echo "<script type='text/javascript'>window.location='$pagina';</script>";
			
		}else{
			echo "<script type='text/javascript'>window.history.back();</script>";
			echo"<script>alert('$error')</script>";
		}
	}
	OCILogoff($conn);
?>
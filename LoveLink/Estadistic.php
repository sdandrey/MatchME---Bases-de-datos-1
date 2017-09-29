<?php
include ("conexion.php");

//Introduciendo el script javascript
$pagina =file_get_contents("Estadistic.php");




$personID=$_GET["id"];



echo "<script type='text/javascript'>

function open(rango1,rango2,cantidad){
	document.getElementById(rango1+' - '+rango2).innerHTML=cantidad;

}

function contEjercicios(numero,id){
	
	window.location='Estadistic.php?idt=1&id='+id+'&num='+numero;
	openVentanaActividad();
	document.getElementById('contE').innerHTML='Cantidad: ' + numero;



}
function contHobbies(numero,id){
	window.location='Estadistic.php?idt=2&id='+id+'&numm='+numero;
	openVentanaActividad();
	document.getElementById('contH').innerHTML='Cantidad: ' + numero;
}
</script>";







	$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin selectREdades(:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection
	
	
$i=0;
$str="";


$totalPersonas=0;



		$r=0;

		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable

		$stid = oci_parse($conn, "begin :ret :=count_Persons(); end;");

		oci_bind_by_name($stid, ':ret', $r, 200);
		oci_execute($stid);


		ocilogoff($conn);

		$totalPersonas=$r;


		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable

		$stid = oci_parse($conn, "begin :ret :=countMarried(); end;");

		oci_bind_by_name($stid, ':ret', $casadas, 200);
		oci_execute($stid);


		ocilogoff($conn);









echo "<!Doctype html>
<html>
<head>
	<title>Estadisticas</title>
	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<link rel='stylesheet' type='text/css' href='css/estadisticas.css'>
	<link rel='stylesheet' type='text/css' href='css/CuadroEstadisticas.css'>
	<script type='text/javascript'>
		function openVentanaRangos(){
			$('.ventanaActividad').hide();
			$('.ventanaWinks').hide();
			$('.ventanaMeBuscan').hide();
			$('.ventanaRangos').fadeIn();
		}
		function openVentanaActividad(){
			$('.ventanaRangos').hide();
			$('.ventanaWinks').hide();
			$('.ventanaMeBuscan').hide();
			$('.ventanaActividad').fadeIn();
		}
		function openVentanaWinks(){
			$('.ventanaRangos').hide();
			$('.ventanaActividad').hide();
			$('.ventanaMeBuscan').hide();
			$('.ventanaWinks').fadeIn();
		}
		function openVentanaMeBuscan(){
			$('.ventanaRangos').hide();
			$('.ventanaActividad').hide();
			$('.ventanaWinks').hide();
			$('.ventanaMeBuscan').fadeIn();
		}

	</script>
</head>
<body>
	<header><a href='cerrarSesion.php' id='cerrarSesion'><b>Cerrar Sesión</b></a></header>
	<div class='maxMenus'>
		<div class='menus' id='uno'>
			<a href='javascript:openVentanaRangos();'>
				<img class='icon' src='iconos/1.png'>
				<p class='texto'>Personas</p>
			</a>
		</div>
		<div class='menus' id='dos'>
			<a href='javascript:openVentanaActividad();'>
				<img class='icon' src='iconos/2.png'>
				<p class='texto'>Actividades</p>
			</a>
		</div>
		<div class='menus' id='tres'>
			<a href='javascript:openVentanaWinks();'>
				<img class='icon' src='iconos/3.png'>
				<p class='texto'>Top Winks</p>
			</a>
		</div>
		<div class='menus' id='cuatro'>
			<a href='javascript:openVentanaMeBuscan();'>
				<img class='icon' src='iconos/4.png'>
				<p class='texto'>Top me buscan</p>
			</a>
		</div>
		<div class='menus' id='cinco'>
			<a href='Busquedas.php'>
				<img class='icon' src='iconos/5.png'>
				<p class='texto'>Volver</p>
			</a>
		</div>
	</div>
	<div class='ventanas'>
		<div class='ventanaRangos'>
			<p>Personas registradas en total: $totalPersonas<br>Personas que encontraron pareja por el sistema: 0<br>Personas casadas por el sistema: $casadas <br>Rango de edad mas buscado: 18-25 años</p>
			<table>
				
					<td colspan='2'>Personas en rango de edad</td>";

	

echo "</table>";

//Fin de tabla rango de edades:

//Tabla de genero
$conn = OCILogon($user, $pass, $db);
$outrefc = ocinewcursor($conn); //Declare cursor variable

$stid = oci_parse($conn, "begin :ret :=countMale(); end;");

oci_bind_by_name($stid, ':ret', $r, 200);
oci_execute($stid);


ocilogoff($conn);



echo "<table>
				
<td colspan='2'>Personas en rango de edad</td>";

echo "				<tr>
					<td>Masculino</td>
					<td>$r</td>
				</tr>";

$conn = OCILogon($user, $pass, $db);
$outrefc = ocinewcursor($conn); //Declare cursor variable

$stid = oci_parse($conn, "begin :ret :=countFemale(); end;");

oci_bind_by_name($stid, ':ret', $r, 200);
oci_execute($stid);


ocilogoff($conn);

echo "				<tr>
					<td>Femenino</td>
					<td>$r</td>
				</tr>";

echo "</table>";










//Personas por genero


echo "<table><td colspan='2'>Estado civil</td>";

//Se obtiene el cursor con los valores:

	$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin CountMariStatus(:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection
//Se comienza a crear la tabla partir de los valores:


	





$i=0;

	for($i;$i<count($data["MARITAL_STATUS_NAME"]);$i++){
		$nombre1=$data["MARITAL_STATUS_NAME"][$i];
		$nombre2=$data["(SELECTCOUNT(*)FROMMARITAL_STATUS_X_PERSONWHEREFK_MARITAL_STATUS_ID=MARITAL_STATUS_ID)"][$i];
		echo "<tr><td>$nombre1</td>
							<td>$nombre2</td></tr>
		";
		


		

}



echo "</table>";




//PAises y ciudades de un pais:


echo "<table><td colspan='2'>Usuarios registrados por pais</td>";

//Se obtiene el cursor con los valores:




//	paises

$e=0;

$conn = OCILogon($user, $pass, $db);
$outrefc = ocinewcursor($conn); //Declare cursor variable
$mycursor = ociparse ($conn, 'begin getCountries(:curs) ; end;'); // prepare procedure call
ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
$ret = ociexecute($mycursor); // Execute function
$ret = ociexecute($outrefc); // Execute cursor
$nrows = ocifetchstatement($outrefc, $paises); // fetch data from cursor
ocifreestatement($mycursor); // close procedure call
ocifreestatement($outrefc); // close cursor
ocilogoff($conn); // close database connection




for($e;$e<count($paises["COUNTRY_ID"]);$e++){

	$id_pais=$paises["COUNTRY_ID"][$e];
	$nombre_pais=$paises["COUNTRY_NAME"][$e];


	$i=0;

$conn = OCILogon($user, $pass, $db);
$outrefc = ocinewcursor($conn); //Declare cursor variable
$mycursor = ociparse ($conn, 'begin 
PersonasinCity('.$id_pais.',:curs) ; end;'); // prepare procedure call
ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
$ret = ociexecute($mycursor); // Execute function
$ret = ociexecute($outrefc); // Execute cursor
$nrows = ocifetchstatement($outrefc, $cities); // fetch data from cursor
ocifreestatement($mycursor); // close procedure call
ocifreestatement($outrefc); // close cursor
ocilogoff($conn); // close database connection

$res="";



$totalPais=0;
$i=0;

	for($i;$i<count($cities["CITY_NAME"]);$i++){





		$nombre1=$cities["CITY_NAME"][$i];
		$nombre2=$cities["(SELECTCOUNT(*)FROMPERSONWHERECITY_ID=FK_CITY_ID)"][$i];
		$totalPais=$totalPais+$nombre2;
		$res=$res."<tr><td>$nombre1</td>
			<td>$nombre2</td></tr>
		";
		


		

}


$res=$res;

echo "
<tr><td>---$nombre_pais---</td>
			<td>Total: $totalPais</td></tr>



".$res."

";











}









echo "</table>";















$var1=$_GET["num"];



echo "</div>
		<div class='ventanaActividad'>
			<ul class='nav'>
				<li id='Ejercicio'><a href='#'>Ejercicio</a>
					<ul>

					";	
	$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin CountExercises(:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection



$i=0;
$nombre2=-1;

for($i;$i<count($data["EXERCISE_NAME"]);$i++){
	$id1=$data["EXERCISE_ID"][$i];
		$nombre1=$data["EXERCISE_NAME"][$i];
		$nombre2=$data["(SELECTCOUNT(*)FROMEXERCISE_X_PERSONWHEREFK_EXERCISE_ID=EXERCISE_ID)"][$i];
		echo "<li id='$nombre1'><a href='javascript:contEjercicios($nombre2,$id1);'>$nombre1</a></li>
		";

}


					
echo "
					</ul>
				</li>
			</ul>
			<li id='Cantidad1'><a id='contE' href='#'>Cantidad: $var1 </a></li>
			<ul class='nav'>
				<li id='Hobbie'><a href='#'>Hobbie</a>
					<ul>";
					


$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin CountHobbie(:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection

$i=0;
for($i;$i<count($data["HOBBIE_NAME"]);$i++){
	$id1=$data["HOBBIE_ID"][$i];
		$nombre1=$data["HOBBIE_NAME"][$i];
		$nombre2=$data["(SELECTCOUNT(*)FROMHOBBIE_X_PERSONWHEREFK_HOBBIE_ID=HOBBIE_ID)"][$i];
		echo "<li id='$nombre1'><a href='javascript:contHobbies($nombre2,$id1);'>$nombre1</a></li>
		";
		


		

}


















					echo "
					</ul>
				</li>";


if(isset($_GET["idt"])){
		$ses=$_GET["id"];
if($_GET["idt"]==1){



			$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin getPersonasEnExercise('.$ses.',:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection


	//var_dump($data);





		}

if($_GET["idt"]==2){


			$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin getPersonasEnHobbie('.$ses.',:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection

}

	$i=0;




		for($i;$i<count($data["FK_PERSON_ID"]);$i++){





		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, 'begin GetCard('.$data["FK_PERSON_ID"][$i].',:curs) ; end;'); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $persona); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor




		$identificador=$persona['PERSON_ID'][0];
		$nombre=$persona['PERSON_NAME'][0];
		$apellido=$persona['PERSON_LASTNAME'][0];
		$frase=$persona['PERSON_PHRASE'][0];
		$pais=$persona['COUNTRY_NAME'][0];
		$ciudad=$persona['CITY_NAME'][0];

		$url="abrirPerfil.php?id=".$identificador;
		$imagenPersona="Perfil/default.png";
		for($p=1;$p<6;$p++){
			$stid = oci_parse($conn, "begin :ret :=le.existeImagen('$p','$identificador'); end;");
		    oci_bind_by_name($stid, ':ret', $r, 200);
		    oci_execute($stid);
		    $existe = $r;
		    if($existe != 0){
				$query = 'SELECT BLOBDATA FROM BTAB WHERE FK_PERSON_ID = :MYBLOBID AND IMGPOS = :POS';
				$stmt = oci_parse ($conn, $query);
				oci_bind_by_name($stmt, ':MYBLOBID', $identificador);
				oci_bind_by_name($stmt, ':POS', $p);
			 	oci_execute($stmt, OCI_DEFAULT);
				$arr = oci_fetch_assoc($stmt);
				$result = $arr['BLOBDATA']->load();
				$imagenPersona="data:image/jpeg;base64,".base64_encode( $result );
				$p=6;
			}
		}
		ocilogoff($conn); // close database connection

	echo "<div class='CuadroUsuario'>
	<div class='CuadroImagen'>
		<a href=$url ><img src='$imagenPersona' class=' img-Redonda '></a>
	</div>
	<div class='CuadroGenInfo'>
		<p class='NameText'>Nombre $nombre $apellido </p>
		<p class='NameDir'>Lugar de residencia: $pais $ciudad </p>
	</div>
	<div>
		<p class='NFrase'>Frase: $frase</p>
	</div>
</div>";
}
}
echo "<script type='text/javascript'>openVentanaActividad();</script>";

$var=$_GET["numm"];

echo "





			</ul>
			<li id='Cantidad2'><a id='contH' href='#'>Cantidad: $var </a></li>
		</div>
		<div class='ventanaWinks'>";


//Aqui va mi codigo





			$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin get_TopWinks(:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection



	$i=0;





		for($i;$i<count($data["PERSON_ID"]);$i++){

			$vis=$data["WIN"][$i];





		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, 'begin GetCard('.$data["PERSON_ID"][$i].',:curs) ; end;'); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $persona); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor



		$identificador=$persona['PERSON_ID'][0];
		$nombre=$persona['PERSON_NAME'][0];
		$apellido=$persona['PERSON_LASTNAME'][0];
		$frase=$persona['PERSON_PHRASE'][0];
		$pais=$persona['COUNTRY_NAME'][0];
		$ciudad=$persona['CITY_NAME'][0];

		$url="abrirPerfil.php?id=".$identificador;
		$imagenPersona="Perfil/default.png";
		for($p=1;$p<6;$p++){
			$stid = oci_parse($conn, "begin :ret :=le.existeImagen('$p','$identificador'); end;");
		    oci_bind_by_name($stid, ':ret', $r, 200);
		    oci_execute($stid);
		    $existe = $r;
		    if($existe != 0){
				$query = 'SELECT BLOBDATA FROM BTAB WHERE FK_PERSON_ID = :MYBLOBID AND IMGPOS = :POS';
				$stmt = oci_parse ($conn, $query);
				oci_bind_by_name($stmt, ':MYBLOBID', $identificador);
				oci_bind_by_name($stmt, ':POS', $p);
			 	oci_execute($stmt, OCI_DEFAULT);
				$arr = oci_fetch_assoc($stmt);
				$result = $arr['BLOBDATA']->load();
				$imagenPersona="data:image/jpeg;base64,".base64_encode( $result );
				$p=6;
			}
		}
		ocilogoff($conn); // close database connection


	echo "<div class='CuadroUsuario'>
	<div class='CuadroImagen'>
		<a href=$url ><img src='$imagenPersona' class=' img-Redonda '></a>
	</div>
	<div class='CuadroGenInfo'>
		<p class='NameText'>Nombre $nombre $apellido </p>
		<p class='NameDir'>Lugar de residencia: $pais $ciudad </p>
		<p >Cantidad de Winks: $vis </p>
	</div>
	<div>
		<p class='NFrase'>Frase: $frase</p>
	</div>
</div>";
}
























		echo "

		</div>
		<div class='ventanaMeBuscan'>";

//Aqui va el codigo;




			$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin get_TopVisits(:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection



	$i=0;





		for($i;$i<count($data["FK_HOST"]);$i++){





		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, 'begin GetCard('.$data["FK_HOST"][$i].',:curs) ; end;'); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $persona); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor

		$cont=$data["COUNTER"][$i];





		$identificador=$persona['PERSON_ID'][0];
		$nombre=$persona['PERSON_NAME'][0];
		$apellido=$persona['PERSON_LASTNAME'][0];
		$frase=$persona['PERSON_PHRASE'][0];
		$pais=$persona['COUNTRY_NAME'][0];
		$ciudad=$persona['CITY_NAME'][0];

		$url="abrirPerfil.php?id=".$identificador;
		$imagenPersona="Perfil/default.png";
		for($p=1;$p<6;$p++){
			$stid = oci_parse($conn, "begin :ret :=le.existeImagen('$p','$identificador'); end;");
		    oci_bind_by_name($stid, ':ret', $r, 200);
		    oci_execute($stid);
		    $existe = $r;
		    if($existe != 0){
				$query = 'SELECT BLOBDATA FROM BTAB WHERE FK_PERSON_ID = :MYBLOBID AND IMGPOS = :POS';
				$stmt = oci_parse ($conn, $query);
				oci_bind_by_name($stmt, ':MYBLOBID', $identificador);
				oci_bind_by_name($stmt, ':POS', $p);
			 	oci_execute($stmt, OCI_DEFAULT);
				$arr = oci_fetch_assoc($stmt);
				$result = $arr['BLOBDATA']->load();
				$imagenPersona="data:image/jpeg;base64,".base64_encode( $result );
				$p=6;
			}
		}
		ocilogoff($conn); // close database connection

	echo "<div class='CuadroUsuario'>
	<div class='CuadroImagen'>
		<a href=$url ><img src='$imagenPersona' class=' img-Redonda '></a>
	</div>
	<div class='CuadroGenInfo'>
		<p class='NameText'>Nombre $nombre $apellido </p>
	<p class='NameDir'>Lugar de residencia: $pais $ciudad </p>
	<p>Cantidad de visitas: $cont</p>
	</div>
	<div>
		<p class='NFrase'>Frase: $frase</p>
	</div>
</div>";
}









		echo "


		</div>
	</div>

";









	echo "<script>
	alert('alerta');
	 document.getElementById('contH').innerHTML= var; </script>";

	















echo "

</body>";



	

















?>
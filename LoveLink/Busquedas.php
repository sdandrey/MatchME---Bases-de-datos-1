<?php
	
include ("conexion.php");


$sesion=$_SESSION['person_id'];
$conn = OCILogon($user, $pass, $db);

$imagenPerfil="Perfil/default.png";
for($p=1;$p<6;$p++){
	$stid = oci_parse($conn, "begin :ret :=le.existeImagen('$p','$sesion'); end;");
    oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
    $existe = $r;
    if($existe != 0){
		$query = 'SELECT BLOBDATA FROM BTAB WHERE FK_PERSON_ID = :MYBLOBID AND IMGPOS = :POS';
		$stmt = oci_parse ($conn, $query);
		oci_bind_by_name($stmt, ':MYBLOBID', $sesion);
		oci_bind_by_name($stmt, ':POS', $p);
	 	oci_execute($stmt, OCI_DEFAULT);
		$arr = oci_fetch_assoc($stmt);
		$result = $arr['BLOBDATA']->load();
		$imagenPerfil="data:image/jpeg;base64,".base64_encode( $result );
		$p=6;
	}
}
$url2="cerrarSesion.php";
echo "<!DOCTYPE html>
<html>
	<head>
		<meta charset = 'utf-8'/>
		<meta description ='Love Ink una pagina web que no robara tu informacion para conquistar el mundo'>

		<link  rel='stylesheet' type='text/css' href='css/header-login-Styles.css'/>
		<link  rel='stylesheet' type='text/css' href='css/Input-Style.css'/>


		<link rel='stylesheet' type='text/css' href='css/Estilos-Despliegue-Busqueda.css'>
		<link rel='stylesheet' type='text/css' href='css/CompatibilityProgressBar.css'>
		<link rel='stylesheet' type='text/css' href='css/Skill-Bars.css'>
		<link  rel='stylesheet' type='text/css' href='css/menu-Style.css'/>
        <link  rel='stylesheet' type='text/css' href='css/Filtros.css'/>
		<link  rel='stylesheet' type='text/css' href='fonts/css/font-awesome.min.css'/>
		<link  rel='stylesheet' type='text/css' href='css/evento.css'/>

		<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>

		<script language='javascript' type='text/javascript' src='js/Resize-User-Card.js'></script>
		<script language='javascript' type='text/javascript' src='js/CompatibilityBar.js'></script>
		<script language='javascript' type='text/javascript' src='js/Skill-Bar.js'></script>
		<script language='javascript' type='text/javascript' src='js/menu-Pegajoso.js'></script>
		<script type='text/javascript'>
			var lugares=new Array();
			var cantPaises=0;
			function reiniciaArray(){
				lugares=new Array();
				cantPaises=0;
			}
			function nuevoLugar(pos){
				lugares[pos]=new Array();
			}
			function anadirPais(pos1,pos2,lugar){
				lugares[pos1][pos2]=lugar;
				lugares[pos1][1]=0;
				var select = document.getElementById('paises');
				var option = document.createElement('option');
				option.text = lugar;
				option.value = lugar;
				select.add(option);
				cantPaises=cantPaises+1;
			}
			function anadirLugar(pos1,pos2,lugar){
				var newpos=parseInt(pos2)+1;
				lugares[pos1][newpos]=lugar;
				lugares[pos1][1]=lugares[pos1][1]+1;
			}
			function elegirPais(){
				var select = document.getElementById('ciudades');
				var pais = document.getElementById('paises');
				var seleccion = pais.options[pais.selectedIndex].value;
				while(select.selectedIndex != -1){
					select.remove(select.selectedIndex);
				}
				for(i=0;i<cantPaises;i++){
					if(lugares[i][0] == seleccion){
						var select2 = document.getElementById('ciudades');
						for(k=0;k<lugares[i][1];k++){
							var option = document.createElement('option');
							option.text = lugares[i][k+2];
							option.value = lugares[i][k+2];
							select2.add(option);
						}
						i=lugares.lenght;
					}
				}
			}
			function openEvento2(){
				$('.ventana').slideDown('slow');
			}
			function cerrarEvento2(){
				//window.open('abrirPerfil.php?id=5');
				$('.ventana').slideUp('fast');
			}
		</script>
	
		
		<title>Love Ink Pagina de Besos y Caricias</title>
		<title>Perfil</title>
	</head>
	<body>
		<header>

			<a href=$url2 id='cerrarSesion'><b>Cerrar Sesión</b></a>
			<div id='logo-index-block' >
				<img src='img/LI_LogoG.png' class='Img-Logo'>
			</div>
			<nav id='Menu-Perfil' class='menu'>
			  <ul>
			  		<li><a href='Busquedas.php'>Buscar</a></li>
			  		<li><a href='openEvento.php'>Evento</a></li>
			  		<li><a href='adminCat.php'>Administrar</a></li>
				    <li><a href='Estadistic.php'>Estadisticas</a></li>
				    <li><a href='Busquedas.php?accion=1'>Winks</a></li>
				    <li><a href='Busquedas.php?accion=2'>Visitas</a></li>
			  		<li>
			  			<a class='onHover' href='abrirMiPerfil.php'>Perfil<img id='imgPerfil' src='$imagenPerfil' class='imgPerfil'></a>
			  		</li>
			  </ul>
			</nav>  
			
		</header>
    

	<div class='Result-Content'>
		<div class='Inf-Block'>
	
		</div>";



	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, "begin Match_('$sesion',:curs); end;"); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor

//"PERSON_ID"
//"MATCHP(:B1,PERSON_ID)"


	//var_dump($data);
	$i=0;

	$getWink=$_GET["accion"];
	$data3="";
	$data4="";
	$nombreGet=$_GET["nombre"];
	$apellidoGet=$_GET["apellido"];

	if($nombreGet != "" || $apellidoGet != ""){
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Personas_Por_Nombre('$nombreGet','$apellidoGet',:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data4); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
	}
	if($getWink == 1){
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_PeopleWhoMadeMeWink('$sesion',:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data3); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
	}
	if($getWink == 2){
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_PeopleWhoVisitMe('$sesion',:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data3); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
	}
	ocilogoff($conn); // close database connection
	for($i;$i<count($data["PERSON_ID"]);$i++){
		$hago=1;
		if($getWink > 0){
			$hago=0;
			for($p=0;$p<count($data3["PERSON_ID"]);$p++){
				if($data["PERSON_ID"][$i] == $data3["PERSON_ID"][$p]){
					$p=count($data3["PERSON_ID"]);
					$hago=1;
				}
			}
		}
		if($nombreGet != "" || $apellidoGet != ""){
			$hago=0;
			for($p=0;$p<count($data4["PERSON_ID"]);$p++){
				if($data["PERSON_ID"][$i] == $data4["PERSON_ID"][$p]){
					$p=count($data4["PERSON_ID"]);
					$hago=1;
				}
			}
		}

		if($hago == 1){
		$matche=(int)$data["MATCHP(:B1,PERSON_ID)"][$i];
/*
		$nombre1=$cities["CITY_NAME"][$i];
		$nombre2=$cities["(SELECTCOUNT(*)FROMPERSONWHERECITY_ID=FK_CITY_ID)"][$i];
		$totalPais=$totalPais+$nombre2;
		$res=$res."<tr><td>$nombre1</td>
			<td>$nombre2</td></tr>
	";
	*/	
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


	echo "
		<div class='Carta-Usuario'>
			<div class='Img-Block'>
				<a href=$url ><img src='$imagenPersona' class='fotos'></a>
			</div>
			<div class='Inf-Block'>
				<p>Nombre: $nombre $apellido</p>
				<p>Logar de residencia: $pais , $ciudad </p>
				<p>Frase $frase </p>
			</div>

			<a class = 'More-Graphics' href='#''>
			
			<!--Grafico-->
			<div id='CmpBlock'class='Cmp-Block'>
				<svg class='progress blue' data-progress= $matche version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 80 80' xml:space='preserve'>
					<path class='track' transform='translate(-10 8) rotate(45 50 50)' d='M40,72C22.4,72,8,57.6,8,40C8,22.4,22.4,8,40,8c17.6,0,32,14.4,32,32'></path>
					<text class='display' x='50%' y='60%'>0%</text>
					<path class='fill' transform='translate(-10 8) rotate(45 50 50)' d='M40,72C22.4,72,8,57.6,8,40C8,22.4,22.4,8,40,8c17.6,0,32,14.4,32,32'></path>
				</svg>
				<p class='Compatibility-Text'>MATCH</p>
			</div>
				<!--/Grafico-->
				<!--Barras-->
			<div class='Skill-Bars-Box'>
				<span>Deportes</span>
				<div class='skill-bar'>
					<p class='skill-value'>100</p>
				</div>
				<span>Aspecto</span>
				<div class='skill-bar'>
					<p class='skill-value'>100</p>
				</div>
				<span>Estilo Vida</span>
				<div class='skill-bar'>
					<p class='skill-value'>100</p>
				</div>
				<span>Intereses</span>
				<div class='skill-bar'>
					<p class='skill-value'>100</p>
				</div>
			</div>
				<!--/Barras-->
			</a>
	
		</div>

<!--/////////////////////////////////////////-->";
}
	/*<div class='filtro-Box-3'><span class='fa fa-black-tie'></span></div>
    <div class='filtro-Box-4'><span class='fa fa-life-saver'></span></div>
    <div class='filtro-Box-5'><span class='fa fa-asterisk'></span></div>
    <div class='filtro-Box-6'><span class='fa fa-futbol-o'></span>
    <div class='filtro-Box-2'><span class='fa fa-info'></span></div>*/

}

echo "
		<!--/////////////////////////////////////////-->";
	echo "

	</div>

<!--FIN FILTROSS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
    <div class='filtro-Box-1'><span class='fa fa-user'></span>
    	<form action='filtrar.php' method='POST'>
	    	<b>Filtros:</b><br>
		    <input type='text' placeholder='Nombre' name='nombre'>
		    <input type='text' placeholder='Apellido' name='apellido'><br>
		    <input type='submit' value='Filtrar'></a>
	    	</table>
    	</form>
    </div>


<!--FIN FILTROSS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->




	<div class='ventana'>
					<div class='form'>
						<div class='cerrarEvento'><a href='javascript:cerrarEvento2();'>X</a></div>
						<h1>Registrar Evento</h1>
						<hr>
						<form action='registrarEvento.php' method='POST'>
							<table>
								<tr>
									<td>País:</td>
									<td>
										<select id='paises' onchange='elegirPais()' name='pais'></select>
									</td>
								</tr>
								<tr>
									<td>Ciudad:</td>
									<td>
										<select id='ciudades' name='ciudad'></select>
									</td>
								</tr>
								<tr>
									<td>Hora:</td>
									<td>
										<select name='hora'>
											<option value='1'>1</option>
											<option value='2'>2</option>
											<option value='3'>3</option>
											<option value='4'>4</option>
											<option value='5'>5</option>
											<option value='6'>6</option>
											<option value='7'>7</option>
											<option value='8'>8</option>
											<option value='9'>9</option>
											<option value='10'>10</option>
											<option value='11'>11</option>
											<option value='12'>12</option>
										</select>
										<select name='hora2'>
											<option value='am'>am</option>
											<option value='pm'>pm</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>Dia:</td>
									<td>
										<select name='dia'>
											<option value='1'>1</option>
											<option value='2'>2</option>
											<option value='3'>3</option>
											<option value='4'>4</option>
											<option value='5'>5</option>
											<option value='6'>6</option>
											<option value='7'>7</option>
											<option value='8'>8</option>
											<option value='9'>9</option>
											<option value='10'>10</option>
											<option value='11'>11</option>
											<option value='12'>12</option>
											<option value='1'>13</option>
											<option value='2'>14</option>
											<option value='3'>15</option>
											<option value='4'>16</option>
											<option value='5'>17</option>
											<option value='6'>18</option>
											<option value='7'>19</option>
											<option value='8'>20</option>
											<option value='9'>21</option>
											<option value='10'>22</option>
											<option value='11'>23</option>
											<option value='12'>24</option>
											<option value='1'>25</option>
											<option value='2'>26</option>
											<option value='3'>27</option>
											<option value='4'>28</option>
											<option value='5'>29</option>
											<option value='6'>30</option>
											<option value='7'>31</option>
										</select>
										Mes: 
										<select name='mes'>
											<option value='1'>1</option>
											<option value='2'>2</option>
											<option value='3'>3</option>
											<option value='4'>4</option>
											<option value='5'>5</option>
											<option value='6'>6</option>
											<option value='7'>7</option>
											<option value='8'>8</option>
											<option value='9'>9</option>
											<option value='10'>10</option>
											<option value='11'>11</option>
											<option value='12'>12</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>Nombre:</td>
									<td><input id='nombreEvento' type='text' placeholder='Nombre' name='name'></td>
								</tr>
								<tr>
									<td>Descripción:</td>
									​<td><textarea placeholder='Descripción' name='description' id='descripcionEvento' rows='3' cols='70'></textarea></td>
								</tr>
								<tr>
									<td></td>
									<td><input id='RegistrarEvento' class='button button-block' type='submit' value='Registrar' name='botonRegistrarEvento'>
								</tr>
							</table>
						</form>
					</div>
				</div>
	</body>
</html>";
	

include ("conexion.php");
	$conn = OCILogon($user, $pass, $db);
if(isset($_GET["id"])){
	if($_GET["id"] == 2){
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_all_Country(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		echo "<script type='text/javascript'>reiniciaArray();</script>"; 
		$largo=count($data['COUNTRY_ID']);
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
				//$array[$i][$k+1]=$data2['CITY_NAME'][$k];
			}
		}
		echo "<script type='text/javascript'>openEvento2();</script>"; 
		echo "<script type='text/javascript'>elegirPais();</script>"; 
	}
}
OCILogoff($conn);


?>
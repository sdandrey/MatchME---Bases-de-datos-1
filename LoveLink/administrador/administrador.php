<?php

$nombreTabla="";


    include ("htmlImporter.php");
	include ("conexion.php");

	if(isset($_GET["indice"])){
		$nombreTabla=$_SESSION['nombre'];
	
	$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
//	$mycursor = ociparse ($conn, 'begin insert_'.$nombreTabla.'_Cat(:curs) ; end;'); // prepare procedure call
	$in=$_GET['indice'];

	$mycursor = ociparse ($conn, "begin delete_".$nombreTabla."('$in') ; end;"); // prepare procedure call
	$ret = ociexecute($mycursor); // Execute function
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection
	}


	$b=$_SESSION['var'];
	//echo "<script> alert('$b')</script>";
	if(isset($_POST["Buscar"])){
		$_SESSION['nombre']=$_POST["Busqueda"];
		$nombreTabla=$_SESSION['nombre'];
		
	}else{
		$var1="";
	}
	if(isset($_POST["Agregar"])){
		$nombreTabla=$_SESSION['nombre'];

		$ind=$_POST["indiceAA"]+0;
		$nom=$_POST["nombreAA"];
		$h="";
	//	echo "<script> alert('$nom')</script>";

if($nombreTabla!=""){


	$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
//	$mycursor = ociparse ($conn, 'begin insert_'.$nombreTabla.'_Cat(:curs) ; end;'); // prepare procedure call

	$mycursor = ociparse ($conn, "begin insert_".$nombreTabla."('$ind','$nom','$h') ; end;"); // prepare procedure call
	$ret = ociexecute($mycursor); // Execute function
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection
	}

}

	

	//$nombreTabla="Marital_status";


if($nombreTabla!=""){
	$conn = OCILogon($user, $pass, $db);
	$outrefc = ocinewcursor($conn); //Declare cursor variable
	$mycursor = ociparse ($conn, 'begin get_'.$nombreTabla.'_Cat(:curs) ; end;'); // prepare procedure call
	ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
	$ret = ociexecute($mycursor); // Execute function
	$ret = ociexecute($outrefc); // Execute cursor
	$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
	ocifreestatement($mycursor); // close procedure call
	ocifreestatement($outrefc); // close cursor
	ocilogoff($conn); // close database connection
	//var_dump($data); // show content fo $data variable

}

	//foreach($data as $equipo=>$jugador){
//		echo "El " . $equipo . " es " . $jugador;


			
	





//	}

echo "
	<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'></script>
	<script type='text/javascript' src='js2/manipulacion.js'></script>

<div id='divContenedor'>
		<h1>Catalogos</h1>
		<div id='divContenedorTabla'>

		";
		echo "<form action='administrador.php' method='POST'>
			<h3 id = 'lblBuscarCat'>Buscar Catalogos</h3>
            <input id = 'inputCatalogName' type='text' name='Busqueda' >
            <input id = 'botonBuscar' type='submit' value='Buscar' name='Buscar'><br>
 		</form>";

echo "<table id = 'TablaDeCampos' align='center'>
				<caption>$nombreTabla</caption>
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>

						<th width='22'>&nbsp;</th>
					</tr>
				</thead>
				<tbody>

				
				";




	
	$i=0;
	for($i;$i<count($data[strtoupper($nombreTabla).'_ID']);$i++){
		echo "<tr>\n";
		echo "      <td>".($data[strtoupper($nombreTabla).'_ID'][$i] !==null ? htmlentities($data[strtoupper($nombreTabla).'_ID'][$i], ENT_QUOTES): "")."</td>\n";

		echo "      <td>".($data[strtoupper($nombreTabla).'_NAME'][$i] !==null ? htmlentities($data[strtoupper($nombreTabla).'_NAME'][$i], ENT_QUOTES): "")."</td>\n";
		"<form action='administrador.php' method='POST'>
            <input type='text' name='Busqueda' size='40'><br>
            <input type='submit' value='Buscar' name='Buscar'><br>
 </form>";


		echo "<form action=# method='POST'>
		<td align='right'><input type='button' value='-' class='clsEliminarFila'></td>
		</form>";
		echo "</tr>\n";

	}



			echo "<tr><form action='administrador.php' method='POST'>
			<td><input type='text' name='indiceAA'class='clsAnchoTotal' id='indiceA'></td>
			<td><input type='text' name='nombreAA' class='clsAnchoTotal' id='nombreA'></td>

</tr><br>



		";



	echo "</tbody>
	<tfoot>
					<tr>
						<td colspan='4' align='right'>
										<input type='submit' value='Agregar' name='Agregar'>
		</form><br>

						</td>
					</tr>
				</tfoot>
			</table>

				</div>
	</div>";

	

?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<?php
	$opcion=$_GET["opcion"];
	if($opcion=="contextura"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliContextura";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarContextura" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Body_type_Categories(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['BODY_TYPE_ID']);$i++){
			$valor1=$data['BODY_TYPE_ID'][$i];
			$valor2=$data['BODY_TYPE_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="bebedor"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliBebedor";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarBebedor" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_DRINKER_Categories(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['DRINKER_ID']);$i++){
			$valor1=$data['DRINKER_ID'][$i];
			$valor2=$data['DRINKER_TYPE'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="educacion"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliEducacion";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarEducacion" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Education_level_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['EDUCATION_LEVEL_ID']);$i++){
			$valor1=$data['EDUCATION_LEVEL_ID'][$i];
			$valor2=$data['EDUCATION_LEVEL_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="ejercicio"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliEjercicio";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarEjercicio" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Exercise_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['EXERCISE_ID']);$i++){
			$valor1=$data['EXERCISE_ID'][$i];
			$valor2=$data['EXERCISE_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="ojos"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliOjos";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarOjos" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Eye_color_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['EYE_COLOR_ID']);$i++){
			$valor1=$data['EYE_COLOR_ID'][$i];
			$valor2=$data['EYE_COLOR_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="pelo"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliPelo";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarPelo" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Hair_color_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['HAIR_COLOR_ID']);$i++){
			$valor1=$data['HAIR_COLOR_ID'][$i];
			$valor2=$data['HAIR_COLOR_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="hobbie"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliHobbie";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarHobbie" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Hobbie_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['HOBBIE_ID']);$i++){
			$valor1=$data['HOBBIE_ID'][$i];
			$valor2=$data['HOBBIE_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="lenguaje"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliLenguaje";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarLenguaje" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Language_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['LANGUAGE_ID']);$i++){
			$valor1=$data['LANGUAGE_ID'][$i];
			$valor2=$data['LANGUAGE_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="estado"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliEstado";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarEstado" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Marital_status_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['MARITAL_STATUS_ID']);$i++){
			$valor1=$data['MARITAL_STATUS_ID'][$i];
			$valor2=$data['MARITAL_STATUS_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="ocupacion"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliOcupacion";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarOcupacion" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Ocupation_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['OCUPATION_ID']);$i++){
			$valor1=$data['OCUPATION_ID'][$i];
			$valor2=$data['OCUPATION_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="religion"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliReligion";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarReligion" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Religion_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['RELIGION_ID']);$i++){
			$valor1=$data['RELIGION_ID'][$i];
			$valor2=$data['RELIGION_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="piel"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliPiel";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarPiel" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Skin_color_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['SKIN_COLOR_ID']);$i++){
			$valor1=$data['SKIN_COLOR_ID'][$i];
			$valor2=$data['SKIN_COLOR_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="ejerFrec"){
		?>
		<script type="text/javascript">
		function anadir(id,nombre) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdNombre=document.createElement("td");
			var textID=document.createTextNode(id);
			var textNombre=document.createTextNode(nombre);
			var boton=document.createElement("input");
			boton.type="submit";
			boton.value="Eliminar";
			boton.name="eliEjerFrec";
			input.type="text";
			input.value=id;
			input.name="id";
			input.readOnly=true;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdNombre.appendChild(textNombre);
			tr.appendChild(tdID);
			tr.appendChild(tdNombre);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Nombre:<input type="text" name="nuevo" placeholder="Nombre"></td>
		<td><input type="submit" name="agregarEjerFrec" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id    /    Nombre    /    Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Exercise_frecuency_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['EXERCISE_FRECUENCY_ID']);$i++){
			$valor1=$data['EXERCISE_FRECUENCY_ID'][$i];
			$valor2=$data['EXERCISE_FRECUENCY_NAME'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="salario"){
		?>
		<script type="text/javascript">
		function anadir(id,desde,hasta) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdDesde=document.createElement("td");
			var tdHasta=document.createElement("td");
			var textID=document.createTextNode(id);
			var textDesde=document.createTextNode(desde);
			var textHasta=document.createTextNode(hasta);
			var boton=document.createElement("input");
			boton.type="submit";
			input.type="text";
			boton.value="Eliminar";
			boton.name="eliSalario";
			input.readOnly=true;
			input.value=id;
			input.name="id";
			input.appendChild(textID);
			tdID.appendChild(input);
			tdDesde.appendChild(textDesde);
			tdHasta.appendChild(textHasta);
			tr.appendChild(tdID);
			tr.appendChild(tdDesde);
			tr.appendChild(tdHasta);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<form action="modTablas.php" method="POST">
		<td>Desde:<input type="text" name="desde" placeholder="Desde"></td>
		<td>Hasta:<input type="text" name="hasta" placeholder="Hasta"></td>
		<td><input type="submit" name="agregarSalario" value="Agregar"></td><br>
		<table id='tabla'>
			<tr>
				<td>Id   /    Desde   /   Hasta   /   Accion</td>
			</tr>
		</table><br>
		</form>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_Salary_range_Cat(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['SALARY_RANGE_ID']);$i++){
			$valor1=$data['SALARY_RANGE_ID'][$i];
			$valor2=$data['SAL_FROM'][$i];
			$valor3=$data['SAL_TO'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2','$valor3');</script>";
		}
		OCILogoff($conn);
	}else if($opcion=="parametros"){
		?>
		<script type="text/javascript">
		function anadir(id,desde,hasta) {
			var table=document.getElementById("tabla");
			var tr=document.createElement("tr");
			var tdID=document.createElement("td");
			var input=document.createElement("input");
			var tdDesde=document.createElement("td");
			var input2=document.createElement("input");
			var tdHasta=document.createElement("td");
			var textID=document.createTextNode(id);
			var textDesde=document.createTextNode(desde);
			var textHasta=document.createTextNode(hasta);
			var boton=document.createElement("input");
			boton.type="submit";
			input.type="text";
			boton.value="Actualizar";
			boton.name="Actualizar";
			input.readOnly=true;
			input.value=id;
			input.name="id";
			input2.name="value";
			input2.value=hasta;
			input.appendChild(textID);
			tdID.appendChild(input);
			tdDesde.appendChild(textDesde);
			input2.appendChild(textHasta);
			tdHasta.appendChild(input2);
			tr.appendChild(tdID);
			tr.appendChild(tdDesde);
			tr.appendChild(tdHasta);
			tr.appendChild(boton);
			var form=document.createElement("form");
			form.action="modTablas.php?id="+id+"&value="+hasta;
			form.method="POST";
			form.appendChild(tr);
			table.appendChild(form);
		}
		</script>
		<table id='tabla'>
			<tr>
				<td>Id   /   Nombre   /   Valor   /   Accion</td>
			</tr>
		</table><br>
		<td><a href="administrador.php"><button>Volver</button></a></td>
	<?php
		include ("conexion.php");
		$conn = OCILogon($user, $pass, $db);
		$outrefc = ocinewcursor($conn); //Declare cursor variable
		$mycursor = ociparse ($conn, "begin get_parameters(:curs) ; end;"); // prepare procedure call
		ocibindbyname($mycursor, ':curs', $outrefc, -1, OCI_B_CURSOR); // bind procedure parameters
		$ret = ociexecute($mycursor); // Execute function
		$ret = ociexecute($outrefc); // Execute cursor
		$nrows = ocifetchstatement($outrefc, $data); // fetch data from cursor
		ocifreestatement($mycursor); // close procedure call
		ocifreestatement($outrefc); // close cursor
		for($i=0;$i<count($data['PARAMETER_ID']);$i++){
			$valor1=$data['PARAMETER_ID'][$i];
			$valor2=$data['PARAMETER_NAME'][$i];
			$valor3=$data['PARAMETER_VALUE'][$i];
			echo "<script type='text/javascript'>anadir('$valor1','$valor2','$valor3');</script>";
		}
		OCILogoff($conn);
	}else{
		?>
		<table>
			<tr>
				<td>Contextura</td>
				<td><a href="administrador.php?opcion=contextura"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Bebedor</td>
				<td><a href="administrador.php?opcion=bebedor"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Nivel de educacion</td>
				<td><a href="administrador.php?opcion=educacion"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Ejercicio</td>
				<td><a href="administrador.php?opcion=ejercicio"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Ojos</td>
				<td><a href="administrador.php?opcion=ojos"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Pelo</td>
				<td><a href="administrador.php?opcion=pelo"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Hobbie</td>
				<td><a href="administrador.php?opcion=hobbie"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Lenguaje</td>
				<td><a href="administrador.php?opcion=lenguaje"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Estado</td>
				<td><a href="administrador.php?opcion=estado"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Ocupacion</td>
				<td><a href="administrador.php?opcion=ocupacion"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Religion</td>
				<td><a href="administrador.php?opcion=religion"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Piel</td>
				<td><a href="administrador.php?opcion=piel"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>EjerFrec</td>
				<td><a href="administrador.php?opcion=ejerFrec"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Salario</td>
				<td><a href="administrador.php?opcion=salario"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td>Parametros</td>
				<td><a href="administrador.php?opcion=parametros"><button>Modificar</button></a></td>
			</tr>
			<tr>
				<td><a href="Busquedas.php"><button>Volver</button></a></td>
			</tr>
		</table>
<?php
}
?>
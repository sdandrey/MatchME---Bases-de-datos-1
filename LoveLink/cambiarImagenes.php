<?php
?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link  rel='stylesheet' type='text/css' href='css/cambiarImagenes.css'/>
<script type="text/javascript">
      function modImg(imagen,nombre){
        document.getElementById(nombre).src=imagen;
      }
</script>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" 
   enctype="multipart/form-data">
   <table>
    <tr>
      <td><input type="submit" value="Volver" name="volver"></td>
    </tr>
   	<tr>
   		<td><input type="file" name="img1"></td>
   		<td><input type="file" name="img2"></td>
   		<td><input type="file" name="img3"></td>
   		<td><input type="file" name="img4"></td>
   		<td><input type="file" name="img5"></td>
   	</tr>
   	<tr>
      <td></td>
      <td></td>
   		<td><input type="submit" value="Subir imagenes" name="botonImg"></td>
   	</tr>
    <tr>
      <td><img id='img1' class="imagen" src="Perfil/default.png"></td>
      <td><img id='img2' class="imagen" src="Perfil/default.png"></td>
      <td><img id='img3' class="imagen" src="Perfil/default.png"></td>
      <td><img id='img4' class="imagen" src="Perfil/default.png"></td>
      <td><img id='img5' class="imagen" src="Perfil/default.png"></td>
    </tr>
    <tr>
      <td><input type="submit" value="Eliminar" name="eli1"></td>
      <td><input type="submit" value="Eliminar" name="eli2"></td>
      <td><input type="submit" value="Eliminar" name="eli3"></td>
      <td><input type="submit" value="Eliminar" name="eli4"></td>
      <td><input type="submit" value="Eliminar" name="eli5"></td>
    </tr>
   </table>
</form>
<?php
$id_person=$_SESSION['person_id'];

if(isset($_POST["volver"])){
  $pagina="abrirMiPerfil.php";
  echo "<script type='text/javascript'>window.location='$pagina';</script>";
}
if(isset($_POST["eli1"])){
    include ("conexion.php");
    $conn = OCILogon($user, $pass, $db);
    if (!$conn){
      echo "Conexion es invalida" . var_dump ( OCIError() );
      die();
    }
    $pos=1;
    $stid = oci_parse($conn, "begin :ret :=le.existeImagen('$pos','$id_person'); end;");
    oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
    $existe = $r;
    if($existe != 0){
      $stid = oci_parse($conn, "begin le.delImagen('$pos','$id_person'); end;");
      oci_execute($stid);
    }
    OCILogoff($conn);
}
if(isset($_POST["eli2"])){
    include ("conexion.php");
    $conn = OCILogon($user, $pass, $db);
    if (!$conn){
      echo "Conexion es invalida" . var_dump ( OCIError() );
      die();
    }
    $pos=2;
    $stid = oci_parse($conn, "begin :ret :=le.existeImagen('$pos','$id_person'); end;");
    oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
    $existe = $r;
    if($existe != 0){
      $stid = oci_parse($conn, "begin le.delImagen('$pos','$id_person'); end;");
      oci_execute($stid);
    }
    OCILogoff($conn);
}
if(isset($_POST["eli3"])){
    include ("conexion.php");
    $conn = OCILogon($user, $pass, $db);
    if (!$conn){
      echo "Conexion es invalida" . var_dump ( OCIError() );
      die();
    }
    $pos=3;
    $stid = oci_parse($conn, "begin :ret :=le.existeImagen('$pos','$id_person'); end;");
    oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
    $existe = $r;
    if($existe != 0){
      $stid = oci_parse($conn, "begin le.delImagen('$pos','$id_person'); end;");
      oci_execute($stid);
    }
    OCILogoff($conn);
}
if(isset($_POST["eli4"])){
    include ("conexion.php");
    $conn = OCILogon($user, $pass, $db);
    if (!$conn){
      echo "Conexion es invalida" . var_dump ( OCIError() );
      die();
    }
    $pos=4;
    $stid = oci_parse($conn, "begin :ret :=le.existeImagen('$pos','$id_person'); end;");
    oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
    $existe = $r;
    if($existe != 0){
      $stid = oci_parse($conn, "begin le.delImagen('$pos','$id_person'); end;");
      oci_execute($stid);
    }
    OCILogoff($conn);
}
if(isset($_POST["eli5"])){
    include ("conexion.php");
    $conn = OCILogon($user, $pass, $db);
    if (!$conn){
      echo "Conexion es invalida" . var_dump ( OCIError() );
      die();
    }
    $pos=5;
    $stid = oci_parse($conn, "begin :ret :=le.existeImagen('$pos','$id_person'); end;");
    oci_bind_by_name($stid, ':ret', $r, 200);
    oci_execute($stid);
    $existe = $r;
    if($existe != 0){
      $stid = oci_parse($conn, "begin le.delImagen('$pos','$id_person'); end;");
      oci_execute($stid);
    }
    OCILogoff($conn);
}
if(isset($_POST["botonImg"])){
  include ("conexion.php");
  $conn = OCILogon($user, $pass, $db);
  if (!$conn){
    echo "Conexion es invalida" . var_dump ( OCIError() );
    die();
  }
  // Insert the BLOB from PHP's tempory upload area
  for($i=1;$i<6;$i++){
    $nombre="img".$i;
    $imprimir=$_FILES[$nombre]['size'];
  if($_FILES[$nombre]['size'] != 0){
      $lob = oci_new_descriptor($conn, OCI_D_LOB);
      $imagen="img".$i;
      $pos=$i;
      $stid = oci_parse($conn, "begin :ret :=le.existeImagen('$pos','$id_person'); end;");
      oci_bind_by_name($stid, ':ret', $r, 200);
      oci_execute($stid);
      $existe = $r;
      if($existe != 0){
        $stid = oci_parse($conn, "begin le.delImagen('$pos','$id_person'); end;");
        oci_execute($stid);
      }
      $stmt = oci_parse($conn, 'INSERT INTO BTAB (BLOBDATA,FK_PERSON_ID,IMGPOS) '
             .'VALUES(EMPTY_BLOB(),:MYBLOBID,:POS) RETURNING BLOBDATA INTO :BLOBDATA');
      oci_bind_by_name($stmt, ':MYBLOBID', $id_person);
      oci_bind_by_name($stmt, ':POS', $pos);
      oci_bind_by_name($stmt, ':BLOBDATA', $lob, -1, OCI_B_BLOB);
      oci_execute($stmt, OCI_DEFAULT);

      if ($lob->savefile($_FILES[$imagen]['tmp_name'])) {
        oci_commit($conn);
      }else{
        $error="Ha surgido un error, favor volver a intentar.";
        echo"<script>alert('$error')</script>";
      }
      $lob->free();
      oci_free_statement($stmt);
    }
  }
  OCILogoff($conn);
}
include ("conexion.php");
  $conn = OCILogon($user, $pass, $db);
  if (!$conn){
    echo "Conexion es invalida" . var_dump ( OCIError() );
    die();
}
for($i=1;$i<6;$i++){
      $stid = oci_parse($conn, "begin :ret :=le.existeImagen('$i','$id_person'); end;");
      oci_bind_by_name($stid, ':ret', $r, 200);
      oci_execute($stid);
      $existe = $r;
      if($existe != 0){
        $query = 'SELECT BLOBDATA FROM BTAB WHERE FK_PERSON_ID = :MYBLOBID AND IMGPOS = :POS';
        $stmt = oci_parse ($conn, $query);
        oci_bind_by_name($stmt, ':MYBLOBID', $id_person);
        oci_bind_by_name($stmt, ':POS', $i);
        oci_execute($stmt, OCI_DEFAULT);
        $arr = oci_fetch_assoc($stmt);
        $result = $arr['BLOBDATA']->load();
        $source="data:image/jpeg;base64,".base64_encode( $result );
        $nombre="img".$i;
        echo "<script type='text/javascript'>modImg('$source','$nombre');</script>";
      }
  }
OCILogoff($conn);
?>
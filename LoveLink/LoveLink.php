<?php
    $sesionAbierta=$_SESSION["sessionAbierta"];
    if($sesionAbierta == 1){
        $pagina="Busquedas.php";
        echo"<script>window.location='$pagina';</script>";
    }else{
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset = "utf-8"/>
		<meta description ="Love Ink una pagina web que no robara tu informacion para conquistar el mundo">

		<link  rel="stylesheet" type="text/css" href="css/NewLogin.css"/>
    <link  rel="stylesheet" type="text/css" href="fonts/css/font-awesome.min.css"/>
    <link  rel="stylesheet" type="text/css" href="css/sliderPerfil.css"/>


		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/sliderPerfil.js"></script>
    <script type="text/javascript">
      function cerrarTerminos(){
        $(".modalTerminos").slideUp("fast");
      }
      function abrirTerminos(){
        $(".modalTerminos").slideDown("slow");
      }
    </script>

		<!--<script language="javascript" type="text/javascript" src="js/login-register-and-validaciones.js"></script>-->

		<title>Love Ink Pagina de Besos y Citas</title>
		<title>Perfil</title>
	</head>
	<body>



<div class="Contenedor-G">
    
    <div class="Col-Izq">
        <div class="img-LoveInk-Login-Box">
            <img class="img-LoveInk-Login" src="img/LI_LogoG.png"/>
        </div>  
        <div class="SliderBox">
  						<div class="slider">

							<img class="imagenDesc s_element s_visible" src="img/slider3.jpg"/>
							<img class="imagenDesc s_element" src="img/slider1.jpg"/>
							<img class="imagenDesc s_element" src="img/slider2.jpeg"/>
							<!--<img class="imagenDesc s_element" src="img/slider3.jpg"/-->
							<img class="imagenDesc s_element" src="img/slider4.jpg"/>
						</div>        
      
        </div>


    </div>
    
    <div class="Col-Der">

        <div class="LabelInRow">
            <form action="getDatos.php" method="POST">
                <span class="fa fa-user"></span>
                <input id="UserInput" type="text" id="user" placeholder="User" name="user">

                <span class="fa fa-key"></span>
                <input id="KeyInput" type="password" id"pass" placeholder="Password" name="pass">

                <input class="button button-block" type="submit" value="Iniciar Sesion" name="boton_login">
            </form>

        </div>


        <div class="RegisterSection">
            <h2 id="RegistrateId">Registrate</h2>
            <form action="getDatos.php" method="POST">
                <div class="NameLastName">
                    <span class="fa fa-user"></span>
                    <input  type="text" id="user" placeholder="Name" name="name">
                    <input  type="text" id="user" placeholder=" Last Name" name="last_name">              
                </div>
                <div class="DataUser">
                    <div>
                    <span class="fa fa-bars"></span>
                    <input type="text" id="user" placeholder="Nombre de Usuario" name="user">
                    </div>
                    <div>
                    <span class="fa fa-envelope"></span>
                    <input type="text" id="user" placeholder="e-mail" name="mail">
                    </div>

                    <div>
                    <span class="fa fa-key"></span>
                    <input type="password" id="user" placeholder="password" name="pass">
                    </div>

                    <div>
                    <span class="fa fa-check-circle"></span>
                    <input type="password" id="user" placeholder="confirm pass" name="pass2">
                    </div>
               </div>
               <input class="button button-block" type="submit" value="Registrarse" name="boton_registrar">
                <a href="javascript:abrirTerminos();">Ver Terminos y condiciones</a>
            </form>
        </div>



    </div>

</div>





  <div class="modalTerminos">
    <div class="terminos">
      <p class="tituloTerminos">
        <b>Términos y condiciones</b>
      </p>
      <p>
        Al registrarse en esta página usted acepta los siguientes términos:<br>
        <br><b>1 - Información personal: </b>Toda información que ingrese al sistema quedara permanentemente guardada en la base de datos, aún si el perfil del usuario es eliminado. Esto incluye contraseñas, correos y mensajes enviados a otros usuarios.<br>
        <br><b>2 - Personas extrañas: </b>Al registrarse en el sistema ustes es totalmente responsable de sus acciones dentro y fuera de él, no nos hacemos responsables ante acosos, se aclara que los administradores no revisan quien se registra por lo tanto al sistema puede ingresar cualquier tipo de persona, así sean personas con buena salud mental tanto como psicópatas.<br>
        <br><b>3 - Cambio de términos y condiciones: </b>Nos damos la libertad de cambiar estos términos y condiciones en cualquier momento, de suceder esto se le notificaran los nuevos términos y condiciones y queda en su jurisdicción aceptarlos o retirarse del sistema.
      </p>
      <a href="javascript:cerrarTerminos();"><img class="botonCerrarTerminos" src="img/entiendoTerminos.png"></a>
    </div>
  </div>
	</body>
</html>
<?php
}
?>
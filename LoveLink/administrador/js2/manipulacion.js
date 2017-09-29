$(document).ready(function(){
	//
	$(document).on('click','caption',function(){
		//obtener la tabla que contiene el caption clickeado
		var objTabla=$(this).parent();
			//el cuerpo de la tabla esta visible?
			//lo siguiente es unicamente para cambiar el icono del caption
			if(objTabla.find('tbody').is(':visible')){
				//eliminamos la clase clsContraer
				$(this).removeClass('clsContraer');
				//agregamos la clase clsExpandir
				$(this).addClass('clsExpandir');
			}else{
				//eliminamos la clase clsExpadir
				$(this).removeClass('clsExpandir');
				//agregamos la clase clsContraer
				$(this).addClass('clsContraer');
			}
			//mostramos u ocultamos el cuerpo de la tabla
			objTabla.find('tbody').toggle();
	});
		
	//evento que se dispara al hacer clic en el boton para agregar una nueva fila
	$(document).on('click','.clsAgregarFila',function(){
		alert("agrega");
		//almacenamos en una variable todo el contenido de la nueva fila que deseamos
		//agregar. pueden incluirse id's, nombres y cualquier tag... sigue siendo html
		var strNueva_Fila='<tr>'+
			'<td><input type="text" class="clsAnchoTotal"></td>'+
			'<td><input type="text" class="clsAnchoTotal"></td>'+

			'<td align="right"><input type="button" value="pepe" class="clsEliminarFila"></td>'+
		'</tr>';
				
		/*obtenemos el padre del boton presionado (en este caso queremos la tabla, por eso
		utilizamos get(3)
			table -> padre 3
				tfoot -> padre 2
					tr -> padre 1
						td -> padre 0
		nosotros queremos utilizar el padre 3 para agregarle en la etiqueta
		tbody una nueva fila*/
		var objTabla=$(this).parents().get(3);
				
		//agregamos la nueva fila a la tabla
		$(objTabla).find('tbody').append(strNueva_Fila);
				
		//si el cuerpo la tabla esta oculto (al agregar una nueva fila) lo mostramos
		if(!$(objTabla).find('tbody').is(':visible')){
			//le hacemos clic al titulo de la tabla, para mostrar el contenido
			$(objTabla).find('caption').click();
		}
	});
	
	//cuando se haga clic en cualquier clase .clsEliminarFila se dispara el evento
	$(document).on('click','.clsEliminarFila',function(){

		var objFila=$(this).parents().get(1);



		var variable=objFila.cells[0].innerHTML;


		window.location=("prueba.php?indice="+variable);







			/*eliminamos el tr que contiene los datos del contacto (se elimina todo el
			contenido (en este caso los td, los text y logicamente, el boton */
	//		$(objFila).remove();
	});
	
	//evento que se produce al hacer clic en el boton que elimina una tabla completamente

			
});
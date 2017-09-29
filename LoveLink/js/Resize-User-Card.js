$(document).ready(function(){
	
	
	
	$(window).on('resize', function(e) {
 		var ancho_Ventana = window.innerWidth;
        if (ancho_Ventana<500) {
        	/*alert(ancho_Ventana);*/
        	$(".Cmp-Block").css('display', 'none');
     		$(".Inf-Block").width('90%');
            $(".More-Graphics").width('260');
             $(".Skill-Bars-Box").width('100%');
            

        

        }
        else {
        	$(".Cmp-Block").css('display', 'inline-block');
        	$(".Inf-Block").width('50%');
            $(".More-Graphics").width('350');
            $(".Skill-Bars-Box").width('69%');
       
		}
 
	});

});
$(document).ready(function(){
	
	$("button[type=Edit]").click(function(e) {
 		e.preventDefault();
       /*alert("clicked");*/
       $(this).parent().siblings('form').toggleClass("Hide-Box");
       $(this).parent().toggleClass("Hide-Box");

       
       
       if($(this).text()=="Guardar")
       	{

                var luis  = $(this).siblings('table');
                var diego = luis[0].id;
                var table = document.getElementById(diego);
                var rows = table.getElementsByTagName("tr");
                
                for(i = 0; i < rows.length; i++)
                {
                    var myTds = rows[i].getElementsByTagName("td");

                    /*Agregando Filas*/
                    var MyDiv = myTds[1].getElementsByTagName("div");
                    var MyCB = MyDiv[0].getElementsByTagName("input");

                    if (MyCB[0].checked == true) {
                    /*{ (MyCB[1].prop( "checked" )*/
                      $(this).parent().siblings("form").children('table').append("<tr><td>"+myTds[0].innerHTML+"</td></tr>");
                    /*};*/
                  };  
                }
       	} 
       



    });

});
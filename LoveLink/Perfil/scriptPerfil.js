$(document).ready(function(){
	

var t=setInterval(function(){avanzar();},10000);

	$('#btn1').click(function(){
		var size = $('.slider').find('.s_element').size();
		$('.slider').find('.s_element').each(
			function(index,value){
				if($(value).hasClass('s_visible'))
				{
					$(value).slideUp();
					$(value).removeClass('s_visible');
					$($('.slider').find('.s_element').get(0)).slideDown();
					$($('.slider').find('.s_element').get(0)).addClass('s_visible');
					return false;
				}
		});
	});
	$('#btn2').click(function(){
		var size = $('.slider').find('.s_element').size();
		$('.slider').find('.s_element').each(
			function(index,value){
				if($(value).hasClass('s_visible'))
				{
					$(value).slideUp();
					$(value).removeClass('s_visible');
					$($('.slider').find('.s_element').get(1)).slideDown();
					$($('.slider').find('.s_element').get(1)).addClass('s_visible');
					return false;
				}
		});
	});
	$('#btn3').click(function(){
		var size = $('.slider').find('.s_element').size();
		$('.slider').find('.s_element').each(
			function(index,value){
				if($(value).hasClass('s_visible'))
				{
					$(value).slideUp();
					$(value).removeClass('s_visible');
					$($('.slider').find('.s_element').get(2)).slideDown();
					$($('.slider').find('.s_element').get(2)).addClass('s_visible');
					return false;
				}
		});
	});
	$('#btn4').click(function(){
		var size = $('.slider').find('.s_element').size();
		$('.slider').find('.s_element').each(
			function(index,value){
				if($(value).hasClass('s_visible'))
				{
					$(value).slideUp();
					$(value).removeClass('s_visible');
					$($('.slider').find('.s_element').get(3)).slideDown();
					$($('.slider').find('.s_element').get(3)).addClass('s_visible');
					return false;
				}
		});
	});
	$('#btn5').click(function(){
		var size = $('.slider').find('.s_element').size();
		$('.slider').find('.s_element').each(
			function(index,value){
				if($(value).hasClass('s_visible'))
				{
					$(value).slideUp();
					$(value).removeClass('s_visible');
					$($('.slider').find('.s_element').get(4)).slideDown();
					$($('.slider').find('.s_element').get(4)).addClass('s_visible');
					return false;
				}
		});
	});
});


function avanzar()
{
	var size = $('.slider').find('.s_element').size();
		$('.slider').find('.s_element').each(
			function(index,value){
				if($(value).hasClass('s_visible'))
				{
					$(value).slideUp();
					$(value).removeClass('s_visible');
					
					if(index+1<size)
					{
						$($('.slider').find('.s_element').get(index+1)).slideDown();
						$($('.slider').find('.s_element').get(index+1)).addClass('s_visible');
						return false;
					}
					else
					{
						$($('.slider').find('.s_element').get(0)).slideDown();
						$($('.slider').find('.s_element').get(0)).addClass('s_visible');	
						return false;
					}
				}
		});
}

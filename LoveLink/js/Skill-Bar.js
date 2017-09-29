$(function(){
  $('.skill-value').each(function () {
		$(this).animate({'width': $(this).html() + '%'},'slow');
    });    
});
/*

	Change the progress by editing the 'data-progress' attr on the svg tag

	JavaScriptless Version Here
		http://codepen.io/cmd430/pen/raoMxr
*/


/* Set Progress | jQuery
======================================*/
//document.querySelector('.fill').getTotalLength();
$(document).ready(function(){
	var max = 150.72259521484375;
	$.each($('.progress'), function( index, value ){
		percent = $(value).data('progress');
		$(value).children($('.fill')).attr('style', 'stroke-dashoffset: ' + ((100 - percent) / 100) * max);
		$(value).children($('.display')).text(percent + '%');
	});
});


/* Set Progress | Vanilla JS
======================================*/
//var forEach = function (array, callback, scope) {
//	for (var i = 0; i < array.length; i++) {
//		callback.call(scope, i, array[i]);
//	}
//};
//window.onload = function(){
//	var max = 150.72259521484375;
//	forEach(document.querySelectorAll('.progress'), function (index, value) {
//		percent = value.getAttribute('data-progress');
//		value.querySelector('.fill').setAttribute('style', 'stroke-dashoffset: ' + ((100 - percent) / 100) * max);
//		value.querySelector('.display').innerHTML = percent + '%';
//	});
//}



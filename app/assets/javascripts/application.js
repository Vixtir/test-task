//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
	$('.add_image').on('click', function(){
		$( '.images' ).append($('.image').html());
	});
});
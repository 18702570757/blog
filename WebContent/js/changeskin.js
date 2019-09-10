$(document).ready(function() {
	if(typeof($.cookie('css')) == "undefined") {
		$.cookie('css', '2');
	}
	$("<link rel='stylesheet' />").attr({
		type: "text/css",
		href: "css/skin0" + $.cookie('css') + ".css"
	}).appendTo($("head"));

	$(".change").click(function() {
		$.cookie('css', (parseInt($.cookie('css'))) % 5 + 1);
		window.location.reload();
	})
});
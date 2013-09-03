var Scrollbar = function(el) {
	el.css({
		width: el.width(),
		height: el.height()
	});

	el.perfectScrollbar();
};

$(function() {
	$('[data-action=scrollbar]').each(function() {
		new Scrollbar($(this));
	});
});
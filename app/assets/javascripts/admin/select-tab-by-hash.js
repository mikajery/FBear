var TabByHash = {
	select: function(hash) {
		$('a[href=' + hash + ']').trigger('click');
	}
};

var Tabbable = function(el) {
	el.on('click', function() {
		window.location.hash = el.attr('href');
	});
};

$(function() {
	$('[data-toggle=tab]').each(function() {
		new Tabbable($(this));
	});

	$(window).on('hashchange', function() {
		TabByHash.select(window.location.hash);
	});
});
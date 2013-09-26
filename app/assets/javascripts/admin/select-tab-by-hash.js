var TabByHash = {
	select: function(hash) {
		$('a[href=' + hash + ']').trigger('click');
	}
};

var Tabbable = function(el) {
	el.on('click', function(e) {
		if (0 == el.closest('.disabled').size())
			window.location.hash = el.attr('href');
		else {
			e.preventDefault();
			return false;
		}
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
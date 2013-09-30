var TabByHash = {
	select: function(hash) {
		$('a[href=' + hash + ']').tab('show');
	},
	init: function() {
		if (location.hash !== '') $('a[href="' + location.hash + '"]').tab('show');
	}
};

var Tabbable = function(el) {
	el.on('shown', function(e) {
		if (0 == el.closest('.disabled').size())
		{
			location.hash = $(e.target).attr('href');
		}

		e.preventDefault();
		return false
	});
};

$(function() {
	$('[data-toggle=tab]').each(function() {
		new Tabbable($(this));
	});

	$(window).on('hashchange', function() {
		TabByHash.select(window.location.hash);
	});

	TabByHash.init();
});
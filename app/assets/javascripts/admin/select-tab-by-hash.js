var TabByHash = {
	select: function(hash) {
		$('a[href=' + hash + ']').trigger('click');
	}
};

$(function() {
	TabByHash.select(window.location.hash);
	
	$(window).on('hashchange', function() {
		TabByHash.select(window.location.hash);
	})
});
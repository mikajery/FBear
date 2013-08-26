var _document = function(_window) {
	var body   = $('body'),
		width  = 0,
		height = 0
	;

	var resizedHeight = function(h) {
		height = h;
		body.trigger('resize:height');
	};

	var resizeListener = function() {
		$(window).resize(function() {
			var _height = body.height();
			if (height != _height) resizedHeight(_height);
		});
	};

	var init = function() {
		resizeListener();
	};

	$(function() {
		init();
	});
};

var Document = new _document(this) ;
var Zoomify = function(el) {

    var zoomed;

    var create = function() {
        var image = $('<img>').attr('src', el.data('zoomify')),
            price = $('<div>').addClass('zoomified-price').html(el.data('price'))
            ;
        return $('<div>').addClass('zoomified').append(image).append(price);
    }

    el.on('mouseenter', function() {
       zoomed = create();
       zoomed.css({left: el.offset().left + el.width() + 14, top: el.offset().top})
       $('body').append(zoomed);
    });

    el.on('mouseleave', function() {
        zoomed.remove();
    });
};

$(function() {
    $('[data-zoomify]').each(function() {
        new Zoomify($(this));
    })
});
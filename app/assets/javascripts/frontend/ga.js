var Ga = function(el) {
    var data = el.data('ga-data'),
        category = el.data('ga-category'),
        label = el.data('da-label')

    el.on('click', function() {
        ga('send', {
            'hitType': 'event',          // Required.
            'eventCategory': category,   // Required.
            'eventAction': 'click',      // Required.
            'eventLabel': label,
            'eventValue': data
        });
    });
};

$(function() {
    $('[data-ga-cat]').each(function() {
        new Ga($(this));
    });
})
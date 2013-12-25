var FancySelect = function(el) {
    el.width(el.width()).select2();
};

$(document).on('ready page:load', function() {
    $('select').each(function() {
        FancySelect($(this));
    });
});
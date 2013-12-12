var FancySelect = function(el) {
    el.width(el.width()).select2();
};

$(function() {
    $('select').each(function() {
        FancySelect($(this));
    });
});
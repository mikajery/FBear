var FancySelect = function(el) {
    el.width(el.width()).select2();
};

$(function() {
    $('select[multiple]').each(function() {
        FancySelect($(this));
    });
});
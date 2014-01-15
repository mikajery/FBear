var FancySelect = function(el) {
    el.select2({
        minimumResultsForSearch: -1
    });
};

$(document).on('ready page:load', function() {
    $('select').each(function() {
        new FancySelect($(this));
    });
});
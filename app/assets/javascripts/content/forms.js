var Form = function(el) {
    var invalidInputs = el.find('input.invalid');

    invalidInputs.on('focus', function() {
        $(this).removeClass('invalid');
    });
};

$(function() {
    $('form').each(function() {
        new Form($(this));
    })
})
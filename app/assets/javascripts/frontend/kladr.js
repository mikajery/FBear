var Kladr = function(el, type) {
    if (el.data('__kladr')) return;
    el.data('__kladr', this);

    var type = type || el.data('kladr');

    el.kladr({
        token: '52d629fa31608fc822000003',
        key: '576b169718f2ebc8d905c51a6f39899661d5543e',
        type: $.kladr.type[type],
        withParents: true,
        verify: true
    });
};

$(document).on('ready page:load', function() {
    $('[data-kladr]').each(function() {
        new Kladr($(this));
    })
});
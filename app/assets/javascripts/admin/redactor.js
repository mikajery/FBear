var Redactor = function(el) {
  var options = {};
  if (el.data('minheight'))
    options['minHeight'] = el.data('minheight')

  el.redactor(options);
}

$(function() {
  $('[data-action=redactor]').each(function() {
    new Redactor($(this));
  })
})
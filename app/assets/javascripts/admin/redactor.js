var Redactor = function(el) {
  var buttons = [],
    options = {
      wym: true,
      buttonsAdd: buttons
    }
  ;

  if (el.data('minheight'))
    options['minHeight'] = el.data('minheight')

  el.redactor(options);
}

$(function() {
  $('[data-action=redactor]').each(function() {
    new Redactor($(this));
  })
})
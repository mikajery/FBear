var Redactor = function(el) {
  el.redactor();
}

$(function() {
  $('[data-action=redactor]').each(function() {
    new Redactor($(this));
  })
})
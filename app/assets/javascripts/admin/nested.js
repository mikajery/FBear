// $( "#sortable1, #sortable2" ).sortable({
//   connectWith: ".connectedSortable"
// }).disableSelection();

var Nested = function(el) {
  el.find('> [data-nested=item] td').each(function() {
    $(this).width($(this).width());
  });

  console.log(el)

  el.sortable({
    items: "> [data-nested=item]",
    axis: 'y',
    placeholder: "placeholder",
    // connectWith: '[data-type=nested]',
    helper: 'clone',
    forcePlaceholderSize: true,
    update: function(e, ui) {
      var items = [];
      el.find("> [data-nested=item]").each(function() {
        items.push($(this).data('nested-id'));
      });

      $.post(el.data('nested-url'), {order: items});
    },
    stop: function(e, ui) {
      ui.item.children('tr:first-child').children('td').effect('highlight', {}, 1000)
    }
  }).disableSelection();
};


$(function() {
  $('[data-type=nested]').each(function() {
    new Nested($(this));
  });
});
var CartVariants = function(el) {
  var price = el.find('[data-cart-variants=price]'),
      items = el.find('[data-cart-variants=items]')
  ;

  items.on('change', function() {
    price.html(items.find('option[value=' + $(this).val() + ']').data('price'));
  });
}

$('[data-type=cart-variants]').each(function() {
  new CartVariants($(this));
});
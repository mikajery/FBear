var CartVariants = function(el) {
  var price = el.closest('[data-cart-items=item]').find('[data-cart-item=price]'),
      items = el.find('[data-cart-variants=items]')
  ;

  items.on('change', function() {
    price.html(items.find('option[value=' + $(this).val() + ']').data('price'));
  });

  items.trigger('change');
}

$('[data-type=cart-variants]').each(function() {
  new CartVariants($(this));
});
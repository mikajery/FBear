var CartVariants = function(el) {
  var item  = el.closest('[data-cart-items=item]'),
      price = item.find('[data-cart-item=price]'),
      items = el.find('[data-cart-variants=items]'),
      picture = item.find('[data-cart-item=picture]'),
      oldPic = picture.attr('src')
  ;

  items.on('change', function() {
    var option = items.find('option[value=' + $(this).val() + ']');
    price.html(option.data('price'));
    picture.attr('src', option.data('picture') ? option.data('picture') : oldPic);
  });

  items.trigger('change');
}

$(document).on('ready page:load', function() {
    $('[data-type=cart-variants]').each(function() {
      new CartVariants($(this));
    });
});
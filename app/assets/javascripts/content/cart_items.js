var CartItems = function(el) {
  var form  = el.find('[data-cart-items=form]'),
      field = el.find('[data-cart-items=data]'),
      items = el.find('[data-cart-items=item]') 
  ;

  form.submit(function(e) {
    items.each(function() {
      form.find('[data-cart-item-field=' + $(this).data('id') + ']').val($(this).find('[data-cart-item=variant]').val())
    });
  });
}

$(function() {
  $('[data-type=cart-items]').each(function() {
    new CartItems($(this));
  });
})
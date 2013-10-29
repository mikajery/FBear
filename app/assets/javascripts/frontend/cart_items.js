var CartItems = function(el) {
  var form    = el.find('[data-cart-items=form]'),
      field   = el.find('[data-cart-items=data]'),
      items   = el.find('[data-cart-items=item]'),
      price   = el.find('[data-cart=total]'),
      selects = el.find('[data-cart-item=variant]'),
      prices  = el.find('[data-cart-item-price]')
  ;

  var totalPrice = function() {
    var totalPrice = 0;
    selects.each(function() {
      var select = $(this);
      totalPrice += select.find('option[value=' + select.val() + ']').data('raw-price')/1
    });

    prices.each(function() {
      totalPrice += $(this).data('cart-item-price')/1;
    });

    price.html(numeral(totalPrice).format('0,0').replace(',', '&nbsp;') + ' р.');
  }

  selects.change(function() {
    totalPrice();
  });

  totalPrice();

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
# хелпер корзины
module Content::CartHelper

  # количество элементов в корзине
  def cart_items
    if @cart.nil?
      token = cookies['_token']
      cart = Order::Cart.find_by_token_and_order_status_id token, nil
    else
      cart = @cart
    end

    cart.items
  end

  # количество элементов в скобках
  def cart_size
    if cart_items.size > 0
      '(' + cart_items.size.to_s + ')'
    end
  end
end
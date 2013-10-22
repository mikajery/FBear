module Content::CartHelper
  def cart_items
    if @cart.nil?
      token = cookies['_token']
      cart = Cart.find_by_key_and_order_status_id token, nil
    else
      cart = @cart
    end

    cart.items
  end

  def cart_size
    if cart_items.size > 0
      '(' + cart_items.size.to_s + ')'
    end
  end
end
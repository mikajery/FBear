require 'dellin_api'

class DeliveryType::Dellin < DeliveryType
  def is_cost_calc_needed?
    true
  end

  def calculate(order, params = nil)
    params = params.nil? ? order.delivery_params : params.select{|k, v| Order.delivery_params.include?(k.to_sym)}

    dellin = DellinApi.new
    request = dellin.get_price(params['city'], order.items_weight*100, order.items_volume/1000)
    price = (request.present? and request['price'].present?) ? request['price'] : nil

    if price.present?
      create_request(order, params, price)
      { price: price, message: '' }
    else
      dellin.raw
    end
  end
end
require 'dellin_api'

class DeliveryType::Dellin < DeliveryType
  def is_cost_calc_needed?
    true
  end

  def calculate(order, params = nil)
    params = params.nil? ? order.delivery_params : params.select{|k, v| Order.delivery_params.include?(k.to_sym)}
    params['weight'] = order.items_weight(true)
    params['volume'] = order.items_volume(true)

    dellin = DellinApi.new
    request = dellin.get_price(params)
    price = (request.present? and request['price'].present?) ? request['price'] : nil

    if price.present?
      create_request(order, params, price)
      { price: price, message: '' }
    else
      dellin.raw
    end
  end
end
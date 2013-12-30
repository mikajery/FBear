require 'dpd_api'

class DeliveryType::Dpd < DeliveryType
  def is_cost_calc_needed?
    true
  end

  def calculate(order, params = nil)
    params = params.nil? ? order.delivery_params : params.select{|k, v| Order.delivery_params.include?(k.to_sym)}

    params['weight'] = order.items_weight(true)
    params['volume'] = order.items_volume(true)

    dpd = DpdApi.new
    price = dpd.get_price(params)

    if price.present?
      create_request(order, params, price)
      { price: price, message: '' }
    else
      { errors: ['Service error!'] }
    end
  end
end
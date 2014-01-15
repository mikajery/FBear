require 'dpd_api'

class DeliveryType::Dpd < DeliveryType
  def is_cost_calc_needed?
    true
  end

  def calculate(order, params = {})
    params = params.present? ? params.select{|k, v| Order.delivery_params.include?(k.to_sym)} : order.delivery_params

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
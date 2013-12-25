class DeliveryType::Dpd < DeliveryType
  def is_cost_calc_needed?
    true
  end

  def calculate(order, params = nil)
    params = params.nil? ? order.delivery_params : params.select{|k, v| Order.delivery_params.include?(k.to_sym)}

    # TODO это тестовое значение стоимости, необходимо рассчитать через API
    price = 1200

    create_request(order, params, price)
    { price: price, message: '' }
  end
end
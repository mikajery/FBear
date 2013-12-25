class DeliveryType::Dpd < DeliveryType
  def is_cost_calc_needed?
    true
  end

  def calculate(order, params)
    { price: 500, message: 'Лал ал ал алал' }
  end
end
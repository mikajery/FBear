# todo краткое описание класса
class OrderValidator < ActiveModel::Validator
  def validate(order)
    if order.delivery_type.present? and order.payment_type.present? and order.order_status != OrderStatus::Canceled.first
      order.errors['delivery_type'] << 'Такой тип оплаты неприменим к выбранному типу доставки!' unless order.delivery_type.payment_types.include? order.payment_type
    end
  end
end
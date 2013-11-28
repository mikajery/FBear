# модель корзины

class Order::Cart < Order
  before_update :check_status_change

  private
  def check_status_change
    if type_change.present?
      if ['Order::Robust', 'Order::Preorder'].include? type
        self.order_status = OrderStatus::New.first unless self.order_status.present?
      end
    end
  end
end
# Контроллер страницы подтверждения покупки
class Content::OrderDoneController < Content::BaseController
  layout 'content'

  before_action :set_order

  def show
  end

  private
  def set_order
    token = cookies['_order_done']
    @order = Order.find_by_token token
  end
end


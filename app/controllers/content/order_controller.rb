# todo краткое описание класса
# todo как происходит процесс покупки? тут надо подробно расписать.
class Content::OrderController < Content::BaseController
  layout 'content'

  before_action :check
  before_action :check_cart, only: [:show]
  before_action :set_order, only: [:done]

  def show
    redirect_to cart_path unless @cart.items.present?
  end

  def done
    @items = @order.items
  end

  def finish
    params = order_params
    params[:client] = Client.from_params params[:client]
    # что за type?
    params[:type] = 'Order::Robust'

    params[:delivery_type] = DeliveryType.find(params[:delivery_type]) if params[:delivery_type].present?
    params[:payment_type] = PaymentType.find(params[:payment_type]) if params[:payment_type].present?

    respond_to do |format|
      if @cart.update(params)

        OrderMailer.order(@cart).deliver
        OrderMailer.notice(@cart).deliver

        cookies['_order_done'] = @cart.token
        format.html { redirect_to order_done_url, notice: '_order_updated_successfully' }
      else
        format.html { render action: 'show' }
      end
    end
  end

  private
  def check
    raise PageNotFound unless @language.is_default
  end

  def set_order
    @order = Order::Preorder.find_by_token @token
  end

  def check_cart
    redirect_to cart_path unless @cart.items.present?
  end

  def order_params
    params.require(:cart).permit([:country, :region, :city, :address, :zip, :delivery_type, :payment_type, :client => [:first_name, :last_name, :email, :phone]])
  end
end


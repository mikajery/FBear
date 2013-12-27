# Контроллер предзаказа
class Content::PreorderController < Content::BaseController
  layout 'content'

  before_action :check
  before_action :check_cart, only: [:show]
  before_action :set_preorder, only: [:done]


  def show
  end

  def done
    @items = @preorder.items
  end

  def finish
    params = order_params
    params[:client] = Client.from_params params[:client]
    params[:type] = 'Order::Preorder'

    respond_to do |format|
      if @cart.update(params)
        PreorderMailer.order(@cart).deliver
        PreorderMailer.notice(@cart).deliver

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

  def check_cart
    redirect_to cart_path unless @cart.items.present?
  end

  def set_preorder
    @preorder = Order::Preorder.find_by_token @token
  end

  def order_params
    params.require(:cart).permit([:client => [:first_name, :last_name, :email, :phone]])
  end
end


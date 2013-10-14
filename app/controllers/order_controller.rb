class OrderController < Content::BaseController
  layout 'content'

  before_action :check
  before_action :set_token
  before_action :set_cart, only: [:show, :finish, :done]

  def done
    @items = @cart.items
  end

  def finish
    params = order_params
    params[:order_status] = OrderStatus.find_by_name "Новый"
    respond_to do |format|
      if @cart.update(params)
        format.html { redirect_to order_done_url, notice: '_order_updated_successfully' }
      end
    end
  end

  private
    def check 
      raise PageNotFound unless @language.is_default
    end

    def set_token
      @token = cookies['_token'] ? cookies['_token'] : Cart.token
    end

    def set_cart
      @cart = Cart.find_by_key @token
    end

    def order_params
      params.require(:cart).permit([:name, :surname, :email, :phone])
    end
end


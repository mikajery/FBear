class CartController < Content::BaseController
  layout 'content'

  before_action :check
  before_action :set_token
  before_action :set_cart, only: [:show, :info, :order, :done]
  before_action :set_good, only: [:buy]

  def buy
    @cart = Cart.find_or_create_by_key @token
    @cart.items << CartGood.from_good(@good)

    respond_to do |format|
      if @cart.save
        cookies['_token'] = @cart.key
        format.html { redirect_to cart_url, notice: '_cart_good_added' }
      end
    end
  end

  def show
  end

  def info
  end

  def done
    @items = @cart.items
  end

  def order
    respond_to do |format|
      if @cart.update(order_params)
        format.html { redirect_to cart_ordered_url, notice: '_order_added' }
      end
    end
  end

  def remove_good
    respond_to do |format|
      if CartGood.delete cart_good_params[:id]
        format.html { redirect_to cart_url, notice: '_cart_good_removed' }
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

    def set_good
      @good = Good.find good_params[:id]
    end

    def set_cart
      @cart = Cart.find_by_key @token
    end

    def good_params
      params.require(:good).permit([:id])
    end

    def cart_good_params
      params.require(:cart_good).permit([:id])
    end

    def order_params
      params.require(:cart).permit([:name, :surname, :email, :phone])
    end
end

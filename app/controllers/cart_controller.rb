class CartController < Content::BaseController
  layout 'content'

  before_action :set_token
  before_action :set_cart, only: [:show, :info]
  before_action :set_good, only: [:buy]

  def buy
    @cart = Cart.find_or_create_by_key @token
    @cart.items << CartGood.from_good(@good)

    respond_to do |format|
      if @cart.save
        cookies['_token'] = @cart.key
        format.html { redirect_to cart_path, notice: '_cart_good_added' }
      end
    end
  end

  def show
  end

  def info
  end

  def remove
    respond_to do |format|
      if CartGood.delete cart_good_params[:id]
        format.html { redirect_to cart_path, notice: '_cart_good_removed' }
      end
    end
  end

  private 
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
end

class CartController < Content::BaseController
  layout 'content'

  before_action :check
  before_action :set_token
  before_action :set_cart, only: [:buy, :show, :info, :order, :done]
  before_action :set_good, only: [:buy]

  def buy
    @cart.items << CartGood.from_good(@good)

    respond_to do |format|
      if @cart.save
        cookies['_token'] = @cart.key
        format.html { redirect_to cart_url, notice: '_cart_good_added' }
      else
        abort @cart.errors.to_json
        format.html { render action: 'show' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    respond_to do |format|
      if @cart.update(order_params)
        format.html { redirect_to cart_ordered_url, notice: '_order_added' }
      end
    end
  end

  def update
    update_cart_params.each do |item|
      cart_item = CartGood.find item[:cart_good]
      cart_item.variant = Variant.find item[:variant]
      cart_item.price = cart_item.variant.price
      cart_item.save
    end

    respond_to do |format|
      format.html { redirect_to order_show_url, notice: '_cart_goods_updated' }
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
      @cart = Cart.find_by_key_and_order_status_id @token, nil

      unless @cart
        @cart = Cart.create key: Cart.token
      end
    end

    def good_params
      params.require(:good).permit([:id])
    end

    def cart_good_params
      params.require(:cart_good).permit([:id])
    end

    def update_cart_params

     if params[:cart]
        params.require(:cart)[:items].map do |item|
          { cart_good: item[0].to_i, variant: item[1]["variant"].to_i }
        end
      else
        []
      end
    end
end

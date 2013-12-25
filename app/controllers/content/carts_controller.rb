# todo краткое описание класса
# todo как происходит процесс покупки? тут надо подробно расписать.
class Content::CartsController < Content::BaseController
  layout 'content'

  before_action :check
  before_action :set_good, only: [:buy]

  def index
  end

  def delivery
    delivery_type = DeliveryType.find(delivery_params[:delivery_type])
    delivery = delivery_type.calculate(@cart, delivery_params)

    unless delivery_type.errors.present?
      render json: delivery.to_json
    else
      render json: { errors: delivery_type.errors[:calculate] }.to_json, status: :unprocessable_entity
    end
  end

  def buy
    @cart.items << OrderGood.from_good(@good)

    respond_to do |format|
      if @cart.save
        cookies['_token'] = @cart.token
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
      cart_item = OrderGood.find item[:order_good]
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
      if OrderGood.delete cart_good_params[:id]
        format.html { redirect_to cart_url, notice: '_cart_good_removed' }
      end
    end
  end

  private
  def check
    raise PageNotFound unless @language.is_default
  end

  def set_good
    @good = Good.find good_params[:id]
  end

  def good_params
    params.require(:good).permit([:id])
  end

  def cart_good_params
    params.require(:order_good).permit([:id])
  end

  def delivery_params
    params.require(:cart).permit([:country, :region, :city, :address, :zip, :delivery_type, :payment_type, :client => [:first_name, :last_name, :email, :phone]])
  end

  def update_cart_params
    if params[:cart]
      params.require(:cart)[:items].map do |item|
        {order_good: item[0].to_i, variant: item[1]['variant'].to_i}
      end
    else
      []
    end
  end
end

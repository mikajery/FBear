# todo краткое описание класса
class Admin::MailerController < Admin::BaseController
  def order()
    @order = Order.find(params[:id])

    render :file => 'order_mailer/order.html.erb', :layout => 'mailer'
  end
end
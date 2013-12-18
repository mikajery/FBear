class Admin::MailerController < Admin::ApplicationController
  def order()
    @order = Order.find(params[:id])

    render :file => 'order_mailer/order.html.erb', :layout => 'mailer'
  end
end
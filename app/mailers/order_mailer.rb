class OrderMailer < ActionMailer::Base
  include TranslateHelper
  add_template_helper(TranslateHelper)

  default from: "orders@lllooch.ru"

  def order order
    @order = order
    mail(to: order.email, subject: T('Предзаказ на сайте www.lllooch.ru', order.language))
  end

  def notice order
    @order = order
    mail(to: 'ilya.doroshin@gmail.com', subject: "Поступил заказ!")
  end
end

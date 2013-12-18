class OrderMailer < ActionMailer::Base
  include SettingsHelper

  include TranslateHelper
  add_template_helper(TranslateHelper)

  default from: S('mail_from', 'order@lllooch.ru')

  def order order
    @order = order
    @current_page = {name: "Письмо клиенту"}
    mail(to: order.email, subject: T('Заказ на сайте www.lllooch.ru', order.language))
  end

  def notice order
    @order = order
    @current_page = {name: "Письмо о новом заказе"}
    mail(to: 'preorder@lllooch.ru', subject: "Поступил заказ!")
  end

end

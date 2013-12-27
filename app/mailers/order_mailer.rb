# Мейлер заказа
class OrderMailer < ActionMailer::Base
  include SettingsHelper

  include TranslateHelper
  add_template_helper(TranslateHelper)

  # пока так, да. нужно вытаскивать в конфиг и цеплять в капистрано
  # TODO вытащить в конфиг и прописать в капистрано копирование конфига
  default from: S('mail_from', 'order@lllooch.ru')

  # письмо клиенту
  def order order
    @order = order
    @current_page = {name: "Письмо клиенту"}
    mail(to: order.email, subject: T('Заказ на сайте www.lllooch.ru', order.language))
  end

  # письмо в ллл о том, что кто-то сделал заказ на сайте
  def notice order
    @order = order
    @current_page = {name: "Письмо о новом заказе"}
    mail(to: 'preorder@lllooch.ru', subject: "Поступил заказ!")
  end

end

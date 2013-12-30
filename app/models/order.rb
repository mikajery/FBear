# модель заказа.
# все лежит в одной таблице, в зависимости от текущего типа подтягиваются валидации
# и методы для текущего типа
#
# STI:
# - cart      корзина
# - preorder  предзаказ
# - robust    заказ
class Order < ActiveRecord::Base
  belongs_to :language

  belongs_to :order_status
  belongs_to :delivery_type
  belongs_to :payment_type

  belongs_to :client, autosave: true

  has_many :order_goods, autosave: true
  has_one :delivery_request

  delegate :first_name, :last_name, :email, :phone, to: :client, allow_nil: true

  validates :token, presence: true, uniqueness: true
  validates_with OrderValidator

  # товары заказа
  def items
    self.order_goods
  end

  # пропускаем ли валидации?
  def skip_validations?
    true if self.order_status == OrderStatus::Canceled.first
  end

  # имя клиента
  def full_name
    self.client.full_name if self.client.present?
  end

  # данные для расчета доставки
  def delivery_params
    self.attributes.select{|k, v| self.class.delivery_params.include?(k.to_sym)}
  end

  # поля, обязательные для расчета доставки
  def self.delivery_params
    [:country, :city, :region, :zip, :address]
  end

  # стоимость товаров
  def items_price
    price = 0
    price += items.map{|item| item.price.to_i}.reduce(:+) unless items.empty?
    price
  end

  # стоимость доставки
  def delivery_price
    price = 0
    price += self.delivery_type.price if self.delivery_type.present?
    price
  end

  # пока так
  def payment_price
    0
  end

  # TODO объем, единица измерения?
  def items_weight
    order_goods.sum(&:good_weight)
  end

  # TODO объем, единица измерения?
  def items_volume
    order_goods.sum(&:good_volume)
  end

  # опции для формы заказа
  # возвращается хэш с услугами и стоимость товаров
  def options
    {
        delivery_types: DeliveryType.active.index_by(&:id).each_with_object({}) {|(key, value), hash| hash[key] = value.options },
        payment_types: PaymentType.active.index_by(&:id).each_with_object({}) { |(key, value), hash| hash[key] = value.options },
        items_price: self.items_price
    }
  end

  # полная стоимость заказа
  def full_price
    self.items_price + self.delivery_price + self.payment_price
  end

  # адрес в одну строку через запятые
  def full_address
    address = []

    address << self.zip if self.zip.present?
    address << Country[self.country].name if self.country.present?
    address << self.city if self.city.present?
    address << self.address if self.city.present?

    address.join ', '
  end

  # генератор ключа корзины
  def self.token
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...50).map{ o[rand(o.length)] }.join
  end
end

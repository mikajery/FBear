class Order < ActiveRecord::Base
  belongs_to :language

  belongs_to :order_status
  belongs_to :delivery_type
  belongs_to :payment_type

  belongs_to :client, autosave: true

  has_many :order_goods, autosave: true

  delegate :first_name, :last_name, :email, :phone, to: :client, allow_nil: true

  validates :token, presence: true, uniqueness: true

  # товары заказа
  def items
    self.order_goods
  end

  # имя клиента
  def full_name
    self.client.full_name if self.client.present?
  end

  def items_price
    price = 0
    price += items.map{|item| item.price.to_i}.reduce(:+) unless items.empty?
    price
  end

  def delivery_price
    price = 0
    price += self.delivery_type.price if self.delivery_type.present?
    price
  end

  def payment_price
    0
  end

  # полная стоимость заказа
  def full_price
    self.items_price + self.delivery_price + self.payment_price
  end

  # генератор ключа корзины
  def self.token
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...50).map{ o[rand(o.length)] }.join
  end
end

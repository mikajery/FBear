class Menu < ActiveRecord::Base
  validates :name, presence: true

  has_many :menu_items, dependent: :destroy

  def items
    menu_items
  end
end

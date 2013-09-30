class Menu < ActiveRecord::Base
  include SortedByName  
  validates :name, presence: true

  has_many :menu_items, dependent: :destroy

  def items
    menu_items
  end
end

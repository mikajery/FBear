# todo краткое описание модуля
module SortedByName
  extend ActiveSupport::Concern

  included do 
    default_scope { order('name ASC') }
  end
end
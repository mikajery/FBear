class Templet < ActiveRecord::Base
  validates :name, presence: true
  validates :src, presence: true
end

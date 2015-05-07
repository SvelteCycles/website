class Size < ActiveRecord::Base

  has_many :inventories
  has_many :products, through: :inventories

  validates :size, uniqueness: true

end

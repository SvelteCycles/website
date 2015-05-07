class Colour < ActiveRecord::Base

  has_many :inventories
  has_many :products, through: :inventories

  validates :colour, uniqueness: true

end

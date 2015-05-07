class Gender < ActiveRecord::Base

  has_many :inventories
  has_many :products, through: :inventories

  validates :sex, uniqueness: true

end

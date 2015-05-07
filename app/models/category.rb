class Category < ActiveRecord::Base

  has_many :products

  validates :category, uniqueness: true

end

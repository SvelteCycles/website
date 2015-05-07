class Product < ActiveRecord::Base

  has_many :inventories
  has_many :genders, through: :inventories
  has_many :sizes, through: :inventories
  has_many :product_images, :dependent => :destroy
  has_many :order_items

  belongs_to :category
  validates_associated :category, message: "category has not been validated"

  accepts_nested_attributes_for :product_images

end

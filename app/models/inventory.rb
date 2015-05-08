class Inventory < ActiveRecord::Base

  belongs_to :product
  belongs_to :gender
  belongs_to :size
  belongs_to :colour
  has_many :product_images, :dependent => :destroy

  has_many :order_items

  validates :sku, uniqueness: true
  
  accepts_nested_attributes_for :product_images

end

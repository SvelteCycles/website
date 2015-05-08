class AddInventoryToProductImages < ActiveRecord::Migration
  def change
    add_reference :product_images, :inventory, index: true
  end
end

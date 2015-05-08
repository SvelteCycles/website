class Men::AccessoriesController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @accessories = Category.find_by_category('accessories')
    @mens_accessories = Inventory.where(product_id: (Product.where(category_id: @accessories.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')
    @accessory = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @accessory.id, gender_id: @mens.id)
  end

end

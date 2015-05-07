class Men::AccessoriesController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    accessories = Category.find_by_category('accessories')
    @mens_accessories = @mens.products.where(category_id: (accessories.id)).distinct
  end

  def show
    @mens = Gender.find_by_sex('male')
    @accessory = Product.find(params[:id])
    @inventory = Inventory.where(product_id: @accessory.id, gender_id: @mens.id)
  end

end

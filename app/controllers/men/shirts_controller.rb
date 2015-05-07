class Men::ShirtsController < ApplicationController

  def index
    mens = Gender.find_by_sex('male')
    shirts = Category.find_by_category('shirts')
    @mens_shirts = mens.products.where(category_id: (shirts.id)).distinct
  end

  def show
    @mens = Gender.find_by_sex('male')
    @shirt = Product.find(params[:id])
    @inventory = Inventory.where(product_id: @shirt.id, gender_id: @mens.id)
  end

end

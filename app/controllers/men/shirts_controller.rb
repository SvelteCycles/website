class Men::ShirtsController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @shirts = Category.find_by_category('shirts')
    @mens_shirts = Inventory.where(product_id: (Product.where(category_id: @shirts.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')
    @shirt = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @shirt.id, gender_id: @mens.id)
  end

end

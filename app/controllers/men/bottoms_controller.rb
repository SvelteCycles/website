class Men::BottomsController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @bottoms = Category.find_by_category('bottoms')
    @mens_bottoms = Inventory.where(product_id: (Product.where(category_id: @bottoms.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')
    @bottoms = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @bottoms.id, gender_id: @mens.id)
  end

end

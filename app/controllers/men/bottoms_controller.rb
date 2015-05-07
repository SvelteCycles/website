class Men::BottomsController < ApplicationController

  def index
    mens = Gender.find_by_sex('male')
    bottoms = Category.find_by_category('bottoms')
    @mens_bottoms = mens.products.where(category_id: (bottoms.id)).distinct
  end

  def show
    @mens = Gender.find_by_sex('male')
    @bottoms = Product.find(params[:id])
    @inventory = Inventory.where(product_id: @bottoms.id, gender_id: @mens.id)
  end

end

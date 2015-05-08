class Women::BottomsController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @bottoms = Category.find_by_category('bottoms')
    @womens_bottoms = Inventory.where(product_id: (Product.where(category_id: @bottoms.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')
    @bottoms = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @bottoms.id, gender_id: @womens.id)
  end

end

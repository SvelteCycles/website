class Women::ShirtsController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @shirts = Category.find_by_category('shirts')
    @womens_shirts = Inventory.where(product_id: (Product.where(category_id: @shirts.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')
    @shirt = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @shirt.id, gender_id: @womens.id)
  end

end

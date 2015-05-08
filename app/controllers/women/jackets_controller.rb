class Women::JacketsController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @jackets = Category.find_by_category('jackets')
    @womens_jackets = Inventory.where(product_id: (Product.where(category_id: @jackets.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')
    @jacket = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @jacket.id, gender_id: @womens.id)
  end

end

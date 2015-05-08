class Men::JacketsController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @jackets = Category.find_by_category('jackets')
    @mens_jackets = Inventory.where(product_id: (Product.where(category_id: @jackets.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')
    @jacket = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @jacket.id, gender_id: @mens.id)
  end

end

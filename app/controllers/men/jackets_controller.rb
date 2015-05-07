class Men::JacketsController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    jackets = Category.find_by_category('jackets')
    @mens_jackets = @mens.products.where(category_id: (jackets.id)).distinct
  end

  def show
    @mens = Gender.find_by_sex('male')
    @jacket = Product.find(params[:id])
    @inventory = Inventory.where(product_id: @jacket.id, gender_id: @mens.id)
  end

end

class Men::JerseysController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    jerseys = Category.find_by_category('jerseys')
    @mens_jerseys = @mens.products.where(category_id: (jerseys.id)).distinct
  end

  def show
    @mens = Gender.find_by_sex('male')
    @jersey = Product.find(params[:id])
    @inventory = Inventory.where(product_id: @jersey.id, gender_id: @mens.id)
  end

end

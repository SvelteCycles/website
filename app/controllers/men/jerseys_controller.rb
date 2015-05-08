class Men::JerseysController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @jerseys = Category.find_by_category('jerseys')
    @mens_jerseys = Inventory.where(product_id: (Product.where(category_id: @jerseys.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')
    @jersey = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @jersey.id, gender_id: @mens.id)
  end

end

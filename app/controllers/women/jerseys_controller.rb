class Women::JerseysController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @jerseys = Category.find_by_category('jerseys')
    @womens_jerseys = Inventory.where(product_id: (Product.where(category_id: @jerseys.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')
    @jersey = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @jersey.id, gender_id: @womens.id)
  end

end

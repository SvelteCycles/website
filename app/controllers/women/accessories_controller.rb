class Women::AccessoriesController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @accessories = Category.find_by_category('accessories')
    @womens_accessories = Inventory.where(product_id: @accessories.id, gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')
    @accessory = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @accessory.id, gender_id: @womens.id)
  end

end

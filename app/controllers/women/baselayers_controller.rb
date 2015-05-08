class Women::BaselayersController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @baselayers = Category.find_by_category('baselayers')
    @womens_baselayers = Inventory.where(product_id: (Product.where(category_id: @baselayers.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')
    @baselayer = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @baselayer.id, gender_id: @womens.id)
  end

end

class Men::BaselayersController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @baselayers = Category.find_by_category('baselayers')
    @mens_baselayers = Inventory.where(product_id: (Product.where(category_id: @baselayers.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')
    @baselayer = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @baselayer.id, gender_id: @mens.id)
  end

end

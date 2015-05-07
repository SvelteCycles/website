class Men::BaselayersController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    baselayers = Category.find_by_category('baselayers')
    @mens_baselayers = @mens.products.where(category_id: (baselayers.id)).distinct
  end

  def show
    @mens = Gender.find_by_sex('male')
    @baselayer = Product.find(params[:id])
    @inventory = Inventory.where(product_id: @baselayer.id, gender_id: @mens.id)
  end

end

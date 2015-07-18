class Men::BaselayersController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @baselayers = Category.find_by_category('baselayers')
    @mens_baselayers = Inventory.where(product_id: (Product.where(category_id: @baselayers.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @baselayer = Inventory.find(params[:id])

    @colour = @baselayer.colour
    @product = @baselayer.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @mens.id,
                                  colour_id: @colour.id)
  end

end

class Women::BaselayersController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @baselayers = Category.find_by_category('baselayers')
    @womens_baselayers = Inventory.where(product_id: (Product.where(category_id: @baselayers.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @baselayer = Inventory.find(params[:id])

    @colour = @baselayer.colour
    @product = @baselayer.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @womens.id,
                                  colour_id: @colour.id)

    @small_inventory = @inventory.find_by(size_id: @small.id)
    @med_inventory = @inventory.find_by(size_id: @medium.id)
    @large_inventory = @inventory.find_by(size_id: @large.id)

  end

end

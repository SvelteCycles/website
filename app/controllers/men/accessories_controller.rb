class Men::AccessoriesController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @accessories = Category.find_by_category('accessories')
    @mens_accessories = Inventory.where(product_id: (Product.where(category_id: @accessories.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @accessory = Inventory.find(params[:id])

    @colour = @accessory.colour
    @product = @accessory.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @mens.id, colour_id: @colour.id)
  end

end

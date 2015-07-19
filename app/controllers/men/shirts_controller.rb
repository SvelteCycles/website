class Men::ShirtsController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @shirts = Category.find_by_category('shirts')
    @mens_shirts = Inventory.where(product_id: (Product.where(category_id: @shirts.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @shirt = Inventory.find(params[:id])

    @colour = @shirt.colour
    @product = @shirt.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @mens.id,
                                  colour_id: @colour.id)
  end

end

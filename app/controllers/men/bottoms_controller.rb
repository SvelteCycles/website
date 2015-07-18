class Men::BottomsController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @bottoms = Category.find_by_category('bottoms')
    @mens_bottoms = Inventory.where(product_id: (Product.where(category_id: @bottoms.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @bottoms = Inventory.find(params[:id])

    @colour = @bottoms.colour
    @product = @bottoms.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @mens.id,
                                  colour_id: @colour.id)
  end

end

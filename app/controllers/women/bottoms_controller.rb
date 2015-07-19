class Women::BottomsController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @bottoms = Category.find_by_category('bottoms')
    @womens_bottoms = Inventory.where(product_id: (Product.where(category_id: @bottoms.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @bottoms = Inventory.find(params[:id])

    @colour = @bottoms.colour
    @product = @bottoms.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @womens.id,
                                  colour_id: @colour.id)
  end

end

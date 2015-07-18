class Women::ShirtsController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @shirts = Category.find_by_category('shirts')
    @womens_shirts = Inventory.where(product_id: (Product.where(category_id: @shirts.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @colour = @shirts.colour
    @product = @shirts.product

    @shirt = Inventory.find(params[:id])
    @inventory = Inventory.where(product_id: @product.id, gender_id: @womens.id,
                                  colour_id: @colour.id)
  end

end

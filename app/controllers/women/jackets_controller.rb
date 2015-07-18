class Women::JacketsController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @jackets = Category.find_by_category('jackets')
    @womens_jackets = Inventory.where(product_id: (Product.where(category_id: @jackets.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @colour = @jackets.colour
    @product = @jackets.product

    @jacket = Inventory.find(params[:id])

    @inventory = Inventory.where(product_id: @product.id, gender_id: @womens.id,
                                  colour_id: @colour.id)
  end

end

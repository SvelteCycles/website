class Men::JacketsController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @jackets = Category.find_by_category('jackets')
    @mens_jackets = Inventory.where(product_id: (Product.where(category_id: @jackets.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @colour = @jackets.colour
    @product = @jackets.product

    @jacket = Inventory.find(params[:id])

    @inventory = Inventory.where(product_id: @product.id, gender_id: @mens.id,
                                  colour_id: @colour.id)
  end

end

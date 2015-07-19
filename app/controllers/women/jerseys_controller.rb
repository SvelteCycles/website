class Women::JerseysController < ApplicationController

  def index
    @womens = Gender.find_by_sex('female')
    @jerseys = Category.find_by_category('jerseys')
    @womens_jerseys = Inventory.where(product_id: (Product.where(category_id: @jerseys.id)), gender_id: @womens.id, size_id: 1)
  end

  def show
    @womens = Gender.find_by_sex('female')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @jersey = Inventory.find(params[:id])

    @colour = @jersey.colour
    @product = @jersey.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @womens.id,
                                  colour_id: @colour.id)
  end

end

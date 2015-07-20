class Men::JerseysController < ApplicationController

  def index
    @mens = Gender.find_by_sex('male')
    @jerseys = Category.find_by_category('jerseys')
    @mens_jerseys = Inventory.where(product_id: (Product.where(category_id: @jerseys.id)), gender_id: @mens.id, size_id: 1)
  end

  def show
    @mens = Gender.find_by_sex('male')

    @small = Size.find_by_size('small')
    @medium = Size.find_by_size('medium')
    @large = Size.find_by_size('large')

    @jersey = Inventory.find(params[:id])

    @colour = @jersey.colour
    @product = @jersey.product

    @inventory = Inventory.where(product_id: @product.id, gender_id: @mens.id,
                                  colour_id: @colour.id)

    @small_inventory = @inventory.find_by(size_id: @small.id)
    @med_inventory = @inventory.find_by(size_id: @medium.id)
    @large_inventory = @inventory.find_by(size_id: @large.id)
  end

end

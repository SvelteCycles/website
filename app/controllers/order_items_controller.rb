class OrderItemsController < ApplicationController

  def create
    @order = current_order

    @size = Size.find_by_size(params[:size])
    @gender = Gender.find_by_sex(params[:gender])
    @colour = Colour.find_by_colour(params[:colour])
    @product = Product.find(params[:product_id])

    @inventory = Inventory.find_by(product_id: @product.id, gender_id: @gender.id, size_id: @size.id, colour_id: @colour.id)

    @order_item = @order.order_items.new(inventory_id: @inventory.id, quantity: 1)
    @order.save
    session[:order_id] = @order.id
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

end

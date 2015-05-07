class BasketsController < ApplicationController

  def show
    @order_items = current_order.order_items
    @amount = current_order.subtotal * 100
  end

end

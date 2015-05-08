class DeliveryController < ApplicationController

  def index
    current_order.update(shipping: params[:shipping])

    if current_order.shipping != nil
      @total = current_order.subtotal + current_order.shipping
      current_order.update(total: @total)
      @amount = current_order.total * 100
    end

    @order_items = current_order.order_items

  end

end

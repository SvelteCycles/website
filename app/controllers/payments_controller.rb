class PaymentsController < ApplicationController

  def new
    @order = Order.find session[:order_id]
  end

  def create
    current_order = Order.find session[:order_id]
    @amount = (current_order.subtotal * 100).round
    @description = current_order.id

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    payment = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'GBP'
    )

    current_order.update(email: params[:stripeEmail],
                        shipping_name: params[:stripeShippingName],
                        shipping_address_line_1: params[:stripeShippingAddressLine1],
                        shipping_address_zip: params[:stripeShippingAddressZip],
                        shipping_city: params[:stripeShippingAddressCity],
                        shipping_country: params[:stripeShippingAddressCountry],
                        shipping_country_code: params[:stripeShippingAddressCountryCode])

    flash[:notice] = "Thank you for your order.
    Order Total: #{current_order.subtotal}."

    @items = OrderItem.where(order_id: current_order.id)
    @items.each do |item|
      stock = Inventory.find(item.inventory_id)
      stock.update(quantity: stock.quantity - item.quantity)
    end

    redirect_to basket_confirmation_path(current_order)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to basket_payments_path(@order)
  end

end

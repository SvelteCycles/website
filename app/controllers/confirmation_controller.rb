class ConfirmationController < ApplicationController

  def show
    @email = current_order.email
    @name = current_order.shipping_name
    @address = current_order.shipping_address_line_1
    @zip = current_order.shipping_address_zip
    @city = current_order.shipping_city
    @country = current_order.shipping_country
    @order = current_order
    @order_items = current_order.order_items

    ContactMailer.confirmation_email(@email, @name, @address, @zip, @country, @order, @order_items).deliver_now
    reset_session
  end

end

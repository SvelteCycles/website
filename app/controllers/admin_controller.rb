class AdminController < ApplicationController

  before_action :authenticate_user!

  def index
    @products = Product.all
    @inventories = Inventory.all
    @orders = Order.includes(:order_items).where.not(order_items: { order: nil})
  end

end

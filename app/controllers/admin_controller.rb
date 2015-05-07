class AdminController < ApplicationController

  before_action :authenticate_user!

  def index
    @products = Product.all
    @inventories = Inventory.all
  end

end

class InventoriesController < ApplicationController

  before_action :authenticate_user!

  def new
    @inventory = Inventory.new
    @products = Product.all
    @genders = Gender.all
    @sizes = Size.all
    @colours = Colour.all
  end

  def create
    @inventory = Inventory.create(inventory_params)

    if @inventory.save
      if params[:photos]
        params[:photos].each { |photo|
          @inventory.product_images.create(photo: photo)
          }
      end
      flash[:notice] = "Your stock has been added"
      redirect_to '/admin'
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    @inventory = Inventory.find(params[:id])
    @inventory.update(inventory_params)

    redirect_to '/admin'
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:notice] = "Stock has been deleted"

    redirect_to '/admin'
  end

  private

    def inventory_params
      params.require(:inventory).permit(:product_id, :gender_id, :size_id,
                                        :colour_id, :quantity, :sku)
    end

end

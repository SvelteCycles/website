class ProductsController < ApplicationController

  before_action :authenticate_user!

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create

      @product = Product.find_or_create_by(product_params)

      if @product.save

        if params[:photos]

          params[:photos].each { |photo|
            @product.product_images.create(photo: photo)
            }
        end
      flash[:notice] = "Your product has been added"
      redirect_to '/admin'
      end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    redirect_to '/admin'
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product has been deleted"

    redirect_to '/admin'
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :description, :details, :category_id)
    end

end

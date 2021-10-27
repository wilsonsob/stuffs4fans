class ProductsController < ApplicationController
before_action :find, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path(@product)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    @products.update(products_params)
    redirect_to products_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path

  private

  def find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :price, :stock, :description)
  end

end

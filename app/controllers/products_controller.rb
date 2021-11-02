class ProductsController < ApplicationController
before_action :find, only: [:show, :edit, :update, :destroy]
skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = policy_scope(Product)
    if params[:query].blank?
      @products = Product.all
    else
      @products = Product.global_search(params[:query])
    end
  end

  def show
    @order = Order.new
  end

  def new
    @product = Product.new
    authorize @product
  end

def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      @product.user.seller = true
      current_user.save
      redirect_to my_offers_path(current_user), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
    redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def find
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :category, :price, :stock, :description, :photo, :img_url)
  end
end

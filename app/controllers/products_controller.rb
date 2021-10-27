class ProductsController < ApplicationController
before_action :find, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    @products.update(products_params)
    redirect_to products_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def find
    @product = Product.find(params[:id])
  end
end

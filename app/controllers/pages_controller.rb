class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home artists artist]
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def home
  end

  def my_orders
    @user = current_user
    @orders = @user.orders
  end

  def my_offers
    @user = current_user
    if @products == @user.products.blank?
      redirect_to root_path, notice: "You haven't registered any offers yet"
    else
      @products = @user.products
    end
  end

  def artists
    @users = User.where(seller: true)
  end

  def artist
    @user = User.find(params[:id])
    @products = @user.products
  end
end

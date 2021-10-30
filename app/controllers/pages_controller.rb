class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
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
      redirect_to "You haven't registered any offers yet", root_path
    else
      @products = @user.products
    end
  end
end

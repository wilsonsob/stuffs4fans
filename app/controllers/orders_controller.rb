class OrdersController < ApplicationController
before_action :find, only: [:show]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to orders_path(@order), notice: 'Order successfully processed!'
    else
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :product_id, :user_id, :date)
  end

  def find
    @order = Order.find(params[:id])
  end
end

class OrdersController < ApplicationController
before_action :find, only: [:show]

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
    authorize @order
  end

  def create
    @product = Product.find(params[:product_id])
    # @order = Order.new(order_params)
    @order = Order.new
    @order.product = @product
    @order.user = current_user
    authorize @order
    # if @order.save
    #   redirect_to orders_path(@order), notice: 'Order successfully processed!'
    # else
    #   render :new
    # end
    @order.save

    # redirect_to user_orders_path(@order, current_user), notice: 'Order successfully processed!'
    redirect_to orders_path(@product, current_user), notice: 'Order successfully processed!'
  end

  def index
    @orders = policy_scope(Order)
  end

  def show
  end

  private

  # def order_params
  #   params.require(:order).permit(:quantity, :product_id, :user_id, :date)
  # end

  def find
    @order = Order.find(params[:id])
    authorize @order
  end
end

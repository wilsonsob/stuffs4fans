class OrdersController < ApplicationController
before_action :find, only: [:show]

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
    authorize @order
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.product = @product
    @order.user = current_user
    authorize @order
    # @order.save
    # redirect_to my_orders_path(@product, current_user), notice: 'Order successfully processed!'
    if @order.save
      redirect_to my_orders_path(@product, current_user), notice: 'Order successfully processed!'
    else
      render :new, notice: 'Enter the quantity!'
    end

  end

  def index
    @orders = policy_scope(Order)
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :product_id, :user_id)
  end

  def find
    @order = Order.find(params[:id])
    authorize @order
  end
end

class OrdersController < ApplicationController
  before_action :create_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(input_params)
    if @order.save
      flash[:notice] = "Order is successfully created"
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @order.update(input_params)
      flash[:notice] = "Order is successfully edited"
      redirect_to orders_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def input_params
    params.require(:order).permit(:quantity, :status, :product_id, :customer_id)
  end

  def create_order
    @order = Order.find(params[:id])
  end
end

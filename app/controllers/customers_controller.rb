# frozen_string_literal: true
class CustomersController < ApplicationController
  before_action :create_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(input_params)
    if @customer.save
      flash[:notice] = "Customer is successfully created"
      redirect_to customers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(input_params)
      flash[:notice] = "Customer is successfully edited"
      redirect_to customers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

  def input_params
    params.require(:customer).permit(:fname, :lname, :email, :phone_number)
  end

  def create_customer
    @customer = Customer.find(params[:id])
  end
end


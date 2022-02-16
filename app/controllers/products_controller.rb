# frozen_string_literal: true
class ProductsController < ApplicationController
  before_action :create_product, only: %i[show edit update destroy]

  def index
    @products = Product.unscoped.all
  end

  def default_scoped
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(input_params)
    if @product.save
      flash[:notice] = "Product is successfully created"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(input_params)
      flash[:notice] = "Product is successfully edited"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def input_params
    params.require(:product).permit(:title, :description, :price, :capacity, :is_active, :status)
  end

  def create_product
    @product = Product.unscoped.find(params[:id])
  end
end


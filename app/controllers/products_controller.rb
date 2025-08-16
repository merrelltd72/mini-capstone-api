# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_admin, except: %i[index show]

  def index
    @products = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end

    render :index
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @product.valid?
      Image.create(product_id: @product.id, url: params[:image_url])
      render :show, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_content
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      description: params[:description] || @product.description
    )
    if @product.valid?
      render :show, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_content
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: 'Product destroyed successfully!' }
  end
end

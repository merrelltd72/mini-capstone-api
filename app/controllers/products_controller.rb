class ProductsController < ApplicationController
  def index
    @products = Product.all 
    render :index
  end

  def show
    @product =Product.find_by(id: params[:id])
    render :show
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      price: params[:price],
    )
    render :show
  end
end

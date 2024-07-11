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

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(

      name: params[:name] || @product.name,
      description: params[:description] || @product.description,
      image_url: params[:image_url] || @product.image_url,
      price: params[:price] || @product.price,
    )

    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Successfully removed the product!"}
  end
end

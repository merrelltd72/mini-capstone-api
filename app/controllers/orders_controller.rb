class OrdersController < ApplicationController

  def index
    @orders = Order.all
    render :index
  end

  def create
    @order = Order.create(
      user_id: params[:user_id], 
      product_id: params[:product_id], 
      quantity: params[:quantity], 
      subtotal: params[:subtotal], 
      tax: params[:tax], 
      total: params[:total]
      )
    if @order.valid?
      render :show, status: 200
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.update(
      quantity: params[:quantity] || @order.quantity, 
      subtotal: params[:subtotal] || @order.subtotal, 
      tax: params[:tax] || @order.tax, 
      total: params[:total] || @order.total
    )
    if @order.valid?
      render :show, status: 200
    else
      render json: { 
        errors: @order.errors.full_messages 
        }, status: 422
    end
  end

  def destroy
    @order = Order,find_by(id: params[:id])
    @product.destroy
    render json: { message: "Order destroyed successfully!" }
  end

end

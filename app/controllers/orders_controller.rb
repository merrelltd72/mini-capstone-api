class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    # Find the product with an id of params[:product_id]
    # Then grab its price
    # Then multiply it by params[:quantity]
    product = Product.find_by(id: params[:product_id])
    price = product.price
    calculated_subtotal = price * params[:quantity].to_i
    # Multiply the subtotal by the tax rate
    calculated_tax = calculated_subtotal * 0.09
    # Add the subtotal and tax
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    render :show
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
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

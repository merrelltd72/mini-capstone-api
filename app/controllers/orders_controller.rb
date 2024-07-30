class OrdersController < ApplicationController

  def create
    @order = Order.create(
      user_id: params[:user_id], 
      product_id: params[:product_id], 
      quantity: params[:quantity], 
      subtotal: params[:subtotal], 
      tax: params[:tax], 
      total: params[:total]
      )
    render :show, status: 200
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

end
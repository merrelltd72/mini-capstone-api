# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    calculated_subtotal = 0
    calculated_tax = 0

    carted_products = current_user.carted_products.where(status: 'carted')

    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
      calculated_tax += carted_product.quantity * carted_product.product.tax
    end

    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )

    carted_products.update(status: 'purchased', order_id: @order_id)

    render :show
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render :show
  end
end

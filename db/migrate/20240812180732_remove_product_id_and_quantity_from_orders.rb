# frozen_string_literal: true

class RemoveProductIdAndQuantityFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :quantity, :integer
  end
end

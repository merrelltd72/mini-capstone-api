# frozen_string_literal: true

class RemoveImageUrlFromProductTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :image_url, :string
  end
end

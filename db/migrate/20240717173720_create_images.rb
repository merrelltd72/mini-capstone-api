# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :url

      t.timestamps
    end
  end
end

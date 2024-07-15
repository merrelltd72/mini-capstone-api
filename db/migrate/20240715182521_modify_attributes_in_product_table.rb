class ModifyAttributesInProductTable < ActiveRecord::Migration[7.1]
  def change
    change_table :products do |t|
      t.string :quantity
    end
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 9, scale: 2
    change_column :products, :description, :text
  end
end

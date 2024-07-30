class Order < ApplicationRecord
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :quantity, numericality: { greater_than: 1 }

  belongs_to :user
  belongs_to :product
end

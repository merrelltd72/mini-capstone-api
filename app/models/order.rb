class Order < ApplicationRecord
  belongs_to :User
  has_many :carted_product
  has_many :products, through: :carted_product
end

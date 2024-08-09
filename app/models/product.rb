class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 1..500 }

  def is_discounted?
    price.to_i <= 10  
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  #def supplier_id
  #  Supplier.find_by(id: supplier_id)
  #end
end

# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_products, dependent: :destroy
end

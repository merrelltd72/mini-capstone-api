# frozen_string_literal: true

json.array! @carted_products, partial: 'carted_products/carted_product', as: :carted_product

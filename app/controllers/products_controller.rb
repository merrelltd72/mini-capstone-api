class ProductsController < ApplicationController
  def get_all_products
    @products = Product.all 
    render template: "products/index"
  end
end

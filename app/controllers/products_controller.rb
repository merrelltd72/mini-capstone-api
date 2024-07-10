class ProductsController < ApplicationController
  def get_all_products
    @contacts = Products.all 
    render template: "products/index"
  end
end

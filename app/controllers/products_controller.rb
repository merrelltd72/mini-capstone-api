class ProductsController < ApplicationController
  def get_all_products
    @products = Product.all 
    render template: "products/index"
  end

  def one_product
    @product =Product.find_by(id: params["id"])
    render template: "products/show"
  end
end

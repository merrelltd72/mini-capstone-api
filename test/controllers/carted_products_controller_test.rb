# frozen_string_literal: true

require 'test_helper'

class CartedProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: 'Test', email: 'test@test.com', password: 'password')
    @supplier = Supplier.create(name: 'Store', email: 'store@test.com', phone_number: '3223232')
    @product = Product.create(supplier_id: @supplier.id, name: 'Item', price: 10, description: 'this is an item')
    @carted_product = CartedProduct.create(user_id: @user.id, product_id: @product.id, quantity: 2, status: 'carted')
    post '/sessions.json', params: { email: 'test@test.com', password: 'password' }
    data = JSON.parse(response.body)
    @jwt = data['jwt']
  end

  test 'index' do
    get '/carted_products.json',
        headers: { 'Authorization' => "Bearer #{@jwt}" }
    assert_response :ok

    data = JSON.parse(response.body)
    assert_equal 1, data.length
  end

  test 'create' do
    assert_difference 'CartedProduct.count', 1 do
      post '/carted_products.json',
           params: { product_id: @product.id, quantity: 2 },
           headers: { 'Authorization' => "Bearer #{@jwt}" }
      assert_response :ok

      data = JSON.parse(response.body)
      assert_equal 'carted', data['status']
    end
  end

  test 'destroy' do
    delete "/carted_products/#{@carted_product.id}.json",
           headers: { 'Authorization' => "Bearer #{@jwt}" }
    assert_response :ok

    @carted_product.reload
    assert_equal 'removed', @carted_product.status
  end
end

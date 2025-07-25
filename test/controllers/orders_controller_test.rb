# frozen_string_literal: true

require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = User.create(name: 'Test', email: 'test@test.com', password: 'password')
    @order = Order.create(user_id: @user.id)
    post '/sessions.json', params: { email: 'test@test.com', password: 'password' }
    data = JSON.parse(response.body)
    @jwt = data['jwt']
  end

  test 'index' do
    get '/orders.json', headers: { 'Authorization' => "Bearer #{@jwt}" }
    assert_response :ok
  end

  test 'create' do
    assert_difference 'Order.count', 1 do
      post '/orders.json', headers: { 'Authorization' => "Bearer #{@jwt}" }
      assert_response :ok
    end
  end

  test 'show' do
    get "/orders/#{@order.id}.json", headers: { 'Authorization' => "Bearer #{@jwt}" }
    assert_response :ok

    data = JSON.parse(response.body)
    assert_equal %w[id subtotal tax total carted_products created_at updated_at], data.keys
  end
end

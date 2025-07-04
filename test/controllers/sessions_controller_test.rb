# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'create' do
    post '/users.json',
         params: { name: 'Test', email: 'test@test.com', password: 'password', password_confirmation: 'password' }
    post '/sessions.json', params: { email: 'test@test.com', password: 'password' }
    assert_response :created

    data = JSON.parse(response.body)
    assert_equal %w[jwt email user_id], data.keys
  end
end

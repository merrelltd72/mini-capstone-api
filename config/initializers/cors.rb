# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'mini-capstone.peterxjang.com', 'http://localhost:5173', 'mini-capstone-frontend-qizt.onrender.com'
    resource '*', headers: :any, methods: %i[get post patch put delete]
  end
end

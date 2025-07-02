# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def current_user
    auth_headers = request.headers['Authorization']
    return unless auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]

    token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
    begin
      decoded_token = generate_decoded_token(token)
      User.find_by(id: decoded_token[0]['user_id'])
    rescue JWT::ExpiredSignature
      nil
    end
  end

  def authenticate_user
    return if current_user

    render json: {}, status: :unauthorized
  end

  def authenticate_admin
    return if current_user&.admin

    render json: {}, status: :unauthorized
  end

  private

  def generate_decoded_token(token)
    JWT.decode(
      token,
      Rails.application.credentials.fetch(:secret_key_base),
      true,
      { algorithm: 'HS256' }
    )
  end
end

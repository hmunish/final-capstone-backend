class ApplicationController < ActionController::API
  before_action :authenticate
  def authenticate
    if request.headers['Authorization']
      begin
        token = request.headers['Authorization'].split.last
        decoded_token = JWT.decode(token, secret)
        payload = decoded_token.first
        user_id = payload['user_id']
        @user = User.find(user_id)
      rescue StandardError => e
        render json: { message: "Error: #{e}", tok: token }, status: :forbidden
      end
    else
      render json: { message: 'No Authorization header sent' }, status: :forbidden
    end
  end

  def secret
    ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
  end

  def token
    auth_header.split[1]
  end

  private

  def create_token(payload)
    JWT.encode(payload, secret)
  end
end

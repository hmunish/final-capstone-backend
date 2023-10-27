module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate, only: [:login]

      def login
        @user = User.find_by(username: params[:username])
        if @user
          payload = { user_id: @user.id }
          secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
          token = create_token(payload)
          render json: {
            username: @user.username,
            token: token
          }
        else
          render json: { message: 'Could not find user' }
        end
      end

      private

      def create_token(payload)
        secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
        JWT.encode(payload, secret)
      end
    end
  end
end

class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
      render json: @users
    end

    def show
      render json: @user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      head :no_content
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username)
    end

    def authenticate
      user = User.find_by(user_params)
      if user
        render json: { message: "Authentication successful"}, status: :ok 
      else
        render json: { message: "Invalid Username"}, status: :unauthorized
      end
    end
end
# def index
#   @user = User.find_by(username: 'testUser2')
#   # @user = User.find_by(name: user_params[:name])

#   if @user
#     render json: {
#       status: { code: 200, message: 'signed in successfuly', data: @user }
#     }, status: :ok
#   else
#     render json: { error: 'User not found' }, status: :not_found
#   end
# end

# private

# def user_params
#   params.require(:user).permit(:name)
# end

# # Code to be used in future



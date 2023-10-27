class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all

    if @users
      render json: { status: { code: 200, message: 'signed in successfuly', data: @user } }, status: :ok
    else
      render json: { error: 'Users not found' }, status: :not_found
    end
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(username: params[:username])

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
    @user.cars.destroy_all
    @user.destroy
    head :no_content
  end

  # def authenticate
  #   @user = User.find_by(username: params[:username])
  #   if @user
  #     render json: { message: "Authentication successful"}, status: :ok
  #   else
  #     render json: { message: "Invalid Username"}, status: :unauthorized
  #   end
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end

class Api::V1::UsersController < ApplicationController
  before_action :authenticate
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
    @user = User.new(user_params)

    if @user.save
      payload = { user_id: @user.id }
      token = create_token(payload)
      response.headers['Authorization'] = "Bearer #{token}"
      render json: @user, status: :created, location: api_v1_user_url(@user)
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
end

class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    current_user = User.find(params[:user_id])
    @car = current_user.cars.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.permit(
      :name,
      :image,
      :description,
      :deposit,
      :finance_fee,
      :option_to_purchase_fee,
      :total_amount_payable,
      :duration
    )
  end
end
class Api::V1::CarsController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end


  private

  def set_user
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :image, :description, :deposit, :finace_fee, :option_to_purchase_fee, :total_amount_payable, :duration)
  end
end

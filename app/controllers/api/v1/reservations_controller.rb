class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate, only: %i[index create show update destroy]
  before_action :set_reservation, only: %i[show update destroy]

  def index
    current_user = User.find(params[:user_id])
    @reservations = current_user.reservations.includes(:user, :car).order(created_at: :desc).all
    if @reservations
      render json: { status: { code: 200, message: 'Reservations retrieved successfully.', data: @reservations } }, status: :ok
    else
      render json: { error: 'Reservations not found.' }, status: :not_found
    end
  end

  def show
    render json: @reservation
  end

  def create
    current_user = User.find(params[:user_id])
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation, status: :ok
    else
      render json: @reservation.errors, status: :uprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: @reservation, head: :no_content
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.permit(:location, :date, :car_id)
  end
end

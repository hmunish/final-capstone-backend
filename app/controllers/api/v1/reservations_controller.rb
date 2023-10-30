class Api::V1::ReservationsController < ApplicationController
  skip_before_action :authenticate, only: %i[index create show update destroy]
  before_action :set_reservation, only: %i[show update destroy]
  def index
    @reservations = Reservation.order(created_at: :desc).all
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
  def destroy
    @reservation.destroy
    head :no_content
  end
end

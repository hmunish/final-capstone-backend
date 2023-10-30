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
end

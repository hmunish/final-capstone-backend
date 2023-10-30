class Api::V1::ReservationsController < ApplicationController
  skip_before_action :authenticate, only: %i[index create show update destroy]
  before_action :set_reservation, only: %i[show update destroy]
end

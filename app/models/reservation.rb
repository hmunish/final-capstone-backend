class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  # Validations

  validates :location, presence: true
  validates :date, presence: true
end

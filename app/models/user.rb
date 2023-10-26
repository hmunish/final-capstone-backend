class User < ApplicationRecord
  has_many :cars
  has_many :reservations

  # Validations

  validates :username, presence: true
end

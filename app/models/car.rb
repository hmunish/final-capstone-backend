class Car < ApplicationRecord
  has_many :reservations
  belongs_to :user

  # Validations

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 1, maximum: 250 }
  validates :deposit, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
  validates :finance_fee, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
  validates :option_to_purchase_fee, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
  validates :total_amount_payable, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end

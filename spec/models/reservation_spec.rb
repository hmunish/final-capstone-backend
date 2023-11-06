require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it 'is valid with a location and date' do
    user = User.create(username: 'testuser')
    car = Car.new(
      name: 'Car 1',
      image: 'car_image.jpg',
      description: 'A nice car',
      deposit: 1000.0,
      finance_fee: 500.0,
      option_to_purchase_fee: 200.0,
      total_amount_payable: 15_000.0,
      duration: 36,
      user_id: user.id
    )
    reservation = car.reservations.new(location: 'Location 1', date: Date.today, car_id: car.id, user_id: user.id)
    expect(reservation).to be_valid
  end

  it 'is invalid without a location' do
    user = User.create(username: 'testuser')
    car = user.cars.create(name: 'Car 1', deposit: 1000.0, finance_fee: 500.0)
    reservation = car.reservations.new(location: nil, date: Date.today)
    expect(reservation).not_to be_valid
  end

  it 'is invalid without a date' do
    user = User.create(username: 'testuser')
    car = user.cars.create(name: 'Car 1', deposit: 1000.0, finance_fee: 500.0)
    reservation = car.reservations.new(location: 'Location 1', date: nil)
    expect(reservation).not_to be_valid
  end
end

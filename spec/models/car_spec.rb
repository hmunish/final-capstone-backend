require 'rails_helper'

RSpec.describe Car, type: :model do
  it 'is valid with all required attributes' do
    user = User.create(username: 'testuser')
    car = user.cars.create(
      name: 'Car 1',
      image: 'car_image.jpg',
      description: 'A nice car',
      deposit: 1000.0,
      finance_fee: 500.0,
      option_to_purchase_fee: 200.0,
      total_amount_payable: 15_000.0,
      duration: 36
    )
    expect(car).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(username: 'testuser')
    car = user.cars.new(name: nil, deposit: 1000.0, finance_fee: 500.0)
    expect(car).not_to be_valid
  end

  it 'is invalid without a deposit' do
    user = User.create(username: 'testuser')
    car = user.cars.new(name: 'Car 1', deposit: nil, finance_fee: 500.0)
    expect(car).not_to be_valid
  end

  it 'is invalid without a finance_fee' do
    user = User.create(username: 'testuser')
    car = user.cars.new(name: 'Car 1', deposit: 1000.0, finance_fee: nil)
    expect(car).not_to be_valid
  end
end

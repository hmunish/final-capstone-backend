user1 = User.create(username: 'testUser1')
user2 = User.create(username: 'testUser2')

car1 = user1.cars.create(
      name: 'Car 1',
      image: 'car_image.jpg',
      description: 'A nice car',
      deposit: 1000.0,
      finance_fee: 500.0,
      option_to_purchase_fee: 200.0,
      total_amount_payable: 15_000.0,
      duration: 36
    )
car2 = user1.cars.create(
      name: 'Car 1',
      image: 'car_image.jpg',
      description: 'A nice car',
      deposit: 1000.0,
      finance_fee: 500.0,
      option_to_purchase_fee: 200.0,
      total_amount_payable: 15_000.0,
      duration: 36
    )

reservation1 = car1.reservations.create(location: 'Location 1', date: Date.today, user_id: user1.id)
reservation2 = car1.reservations.create(location: 'Location 2', date: Date.tomorrow, user_id: user1.id)
require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/users/{user_id}/reservations' do
    get 'Retrieves a list of reservations for a user' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'reservations found' do
        run_test!
      end

      response '404', 'user not found' do
        let(:user_id) { 'invalid_user_id' }
        run_test!
      end
    end

    post 'Creates a new reservation for a user' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          location: { type: :string },
          date: { type: :string, format: 'date' },
          car_id: { type: :string }
        },
        required: %w[location date car_id]
      }

      response '201', 'reservation created' do
        let(:user_id) { create(:user).id }
        let(:reservation) { { location: 'Sample Location', date: '2023-12-31', car_id: create(:car).id } }
        run_test!
      end

      response '404', 'user not found' do
        let(:user_id) { 'invalid_user_id' }
        let(:reservation) { { location: 'Sample Location', date: '2023-12-31', car_id: create(:car).id } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user_id) { create(:user).id }
        let(:reservation) { { location: '', date: '2023-12-31', car_id: create(:car).id } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations/{id}' do
    get 'Retrieves a reservation for a user' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      response '200', 'reservation found' do
        let(:user_id) { create(:user).id }
        let(:id) { create(:reservation, user: User.find(user_id)).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:user_id) { 'invalid_user_id' }
        let(:id) { create(:reservation).id }
        run_test!
      end

      response '404', 'reservation not found' do
        let(:user_id) { create(:user).id }
        let(:id) { 'invalid_id' }
        run_test!
      end
    end

    path '/api/v1/users/{user_id}/reservations/{id}' do
      put 'Update the reservations of each cars added' do
        tags 'Reservation'
        consumes 'apllication/json'
        parameter name: :user_id, in: :path, type: :string, required: true
        parameter name: :id, in: :path, type: :string, required: true
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            location: { type: :string },
            date: { type: :string, format: 'date' },
            car_id: { type: :string }
          }
        }
        response '200', 'Update successful' do
          let(:user_id) { create(:user).id }
          let(:id) { create(:reservation, user: User.find(:user_id).id) }
          let(:reservation) { { location: 'New location', date: '2023-11-01', car_id: create(:car).id } }
          run_test!
        end
        response '404', 'User not found' do
          let(:user_id) { 'nil' }
          let(:id) { create(:reservation, user: User.find(:user_id).id) }
          let(:reservation) { { location: 'New location', date: '2023-11-01', car_id: create(:car).id } }
          run_test!
        end
        response '404', 'Reservation not found' do
          let(:user_id) { create(:user).id }
          let(:id) { 'nil id' }
          let(:reservation) { { location: 'City', date: '2023-11-02', car_id: create(:car).id } }
          run_test!
        end
        response '422', 'Invalid Request' do
          let(:user_id) { create(:user).id }
          let(:id) { create(:reservation, user: User.find(:user_id).id) }
          let(:reservation) { { location: ' ', date: '2023-11-03', car_id: create(:car).id } }
          run_test!
        end
      end

      delete 'Delete an existing reservation for a user' do
        tags 'Reservations'
        consumes 'application/json'
        parameter name: :user_id, in: :path, type: :string, required: true
        parameter name: :id, in: :path, type: :string, required: true

        response '204', 'reservation deleted' do
          let(:user_id) { create(:user).id }
          let(:id) { create(:reservation, user: User.find(:user_id).id) }
          run_test!
        end

        response '404', 'reservation not found' do
          let(:user_id) { 'invalid user_id' }
          let(:id) { create(:reservation).id }
          run_test!
        end

        response '404', 'reservation not found' do
          let(:user_id) { create(:user).id }
          let(:id) { 'invalid id' }
          run_test!
        end
      end
    end
  end
end

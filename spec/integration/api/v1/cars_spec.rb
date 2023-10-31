require 'swagger_helper'

describe 'Cars API' do
  path '/api/v1/users/{user_id}/cars' do
    get 'Retrieves a list of cars for a user' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true

      response '200', 'cars found' do
        run_test!
      end
    end

    post 'Creates a new car for a user' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image: { type: :string },
          description: { type: :string },
          deposit: { type: :number, format: :float },
          finance_fee: { type: :number, format: :float },
          option_to_purchase_fee: { type: :number, format: :float },
          total_amount_payable: { type: :number, format: :float },
          duration: { type: :integer }
        },
        required: ['name', 'image', 'description', 'deposit', 'finance_fee', 'option_to_purchase_fee', 'total_amount_payable', 'duration']
      }

      response '201', 'car created' do
        let(:user_id) { create(:user).id }
        let(:car) { { name: 'CarName', image: 'car.jpg', description: 'Car description', deposit: 1000.0, finance_fee: 500.0, option_to_purchase_fee: 200.0, total_amount_payable: 8000.0, duration: 36 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user_id) { create(:user).id }
        let(:car) { { name: nil, image: 'car.jpg', description: 'Car description', deposit: 1000.0, finance_fee: 500.0, option_to_purchase_fee: 200.0, total_amount_payable: 8000.0, duration: 36 } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/cars/{id}' do
    put 'Updates an existing car for a user' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true
      parameter name: :id, in: :path, type: :string, required: true
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image: { type: :string },
          description: { type: :string },
          deposit: { type: :number, format: :float },
          finance_fee: { type: :number, format: :float },
          option_to_purchase_fee: { type: :number, format: :float },
          total_amount_payable: { type: :number, format: :float },
          duration: { type: :integer }
        }
      }

      response '200', 'car updated' do
        let(:user_id) { create(:user).id }
        let(:id) { create(:car, user_id: user_id).id }
        let(:car) { { name: 'UpdatedCarName' } }
        run_test!
      end

      response '404', 'car not found' do
        let(:user_id) { create(:user).id }
        let(:id) { 'invalid_id' }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user_id) { create(:user).id }
        let(:id) { create(:car, user_id: user_id).id }
        let(:car) { { name: nil } }
        run_test!
      end
    end

    delete 'Deletes an existing car for a user' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true
      parameter name: :id, in: :path, type: :string, required: true

      response '204', 'car deleted' do
        let(:user_id) { create(:user).id }
        let(:id) { create(:car, user_id: user_id).id }
        run_test!
      end

      response '404', 'car not found' do
        let(:user_id) { create(:user).id }
        let(:id) { 'invalid_id' }
        run_test!
      end
    end
  end
end

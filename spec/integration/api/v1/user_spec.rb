require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    get 'Retrieves a list of users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'users found' do
        run_test!
      end
    end

    post 'Creates a new user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }

      response '201', 'user created' do
        let(:user) { { username: 'NewUsername' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: nil } }
        run_test!
      end
    end

    put 'Updates an existing user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        }
      }

      let(:id) { create(:user).id }
      let(:user) { { username: 'UpdatedUsername' } }

      response '200', 'user updated' do
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid_id' }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: nil } }
        run_test!
      end
    end

    delete 'Deletes an existing user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      let(:id) { create(:user).id }

      response '204', 'user deleted' do
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid_id' }
        run_test!
      end
    end
  end
end

require 'swagger_helper'

describe 'Authentication API' do
  path '/api/v1/login' do
    post 'Log in a user' do
      tags 'Authentication'
      produces 'application/json'
      parameter name: :username, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string, example: 'sample_username' }
        },
        required: ['username']
      }

      let(:user) { create(:user) }
      let(:username) { user.username }

      response '200', 'user logged in' do
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end
  end

end

require 'swagger_helper'
# rubocop:disable all

RSpec.describe 'Endpoints for creating a new user account', type: :request do
  path '/signup' do
    post('Create a new user account with this endpoint. An email, username, name, and password are all required. A new session is automatically created and the Authorization credentials are sent in the headers of the response') do
      tags 'Signup'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string },
              username: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: %w[name email username password]
      }
      response(200, 'successful') do
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        run_test!
      end
    end
  end
end

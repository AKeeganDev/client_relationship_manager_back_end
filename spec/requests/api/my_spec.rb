require 'swagger_helper'

RSpec.describe 'Login and Logout', type: :request do
  path '/login' do
    post(
      'Upon successful login this endpoint returns an object with the user\'s basic account info along with
       a bearer token in its response header. Use the bearer token for all future requests during that login session'
    ) do
      tags 'User'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              email: { type: :string },
              password: { format: :string }
            }
          }
        },
        required: %w[email password]
      }
      response(200, 'Logged in sucessfully.') do
        run_test!
      end

      response(403, 'Invalid username or password. Please check your spelling and cases or reset your password') do
        run_test!
      end
    end
  end

  path '/logout' do
    delete('Logs a user out of their current session') do
      tags 'User'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true

      response(200, 'Logged out sucessfully') do
        run_test!
      end

      response(401, 'Couldn\'t find an active session.') do
        run_test!
      end
    end
  end
end

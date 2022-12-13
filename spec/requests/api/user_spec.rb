require 'swagger_helper'

RSpec.describe 'User', type: :request do
  path '/users/{id}' do
    get(
      'Provides data on the User\'s basic account information and a list of all contacts logged in the database'
    ) do
      tags 'User'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      response(200, '') do
        run_test!
      end
    end
  end

  path '/users/{id}' do
    patch('Allows user to update its basic information. Only include the fields you want to update.') do
      tags 'User'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              email: { type: :string },
              name: { format: :string },
              username: { format: :string }
            }
          }
        },
      }
      response(200, 'Account updated successfully!') do
        run_test!
      end
    end
  end
end
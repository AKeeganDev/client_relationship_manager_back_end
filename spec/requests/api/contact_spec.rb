require 'swagger_helper'

RSpec.describe 'Login and Logout', type: :request do

  path '/users/{user_id}/contacts/{id}' do
    get(
      'Provides all the data about specific contact ID provided in the endpoint'
    ) do
      tags 'Contact'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :id, in: :path, required: true
      response(200, '') do
        run_test!
      end
    end
  end

  path '/users/{user_id}/contacts' do
    post(
      'Allows for a contact to be created under the user account found within the authorization credentials'
    ) do
      tags 'Contact'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              name: { type: :string },
              email: { format: :string },
              phone_number: { format: :string }
            }
          }
        },
      }
      response(200, 'contact created successfully') do
        run_test!
      end
      response(422, "Unprocessable Entity") do
        run_test!
      end
    end
  end

  path '/users/{user_id}/contacts/{id}' do
    patch('Allows user to update its basic information. Only include the fields you want to update.') do
      tags 'Contact'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :id, in: :path, required: true
      parameter name: :contact, in: :body, schema: {
        type: :object,
        properties: {
              name: { type: :string },
              email: { format: :string },
              phone_number: { format: :string }
            },
      }
      response(200, 'update successful') do
        run_test!
      end

      response(422, "Unprocessable Entity") do
        run_test!
      end
    end
  end
end

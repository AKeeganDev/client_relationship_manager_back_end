require 'swagger_helper'

RSpec.describe 'Provides Contact data for a given user', type: :request do

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
      'Allows for a contact to be created under the user account found within the authorization credentials. In the body of the request only a name is required'
    ) do
      tags 'Contact'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { format: :string },
          phone_number: { format: :string }
        },
        required: %w[name]
      }
      response(200, 'Contact created successfully') do
        run_test!
      end
      response(422, "Unprocessable Entity") do
        run_test!
      end
    end
  end

  path '/users/{user_id}/contacts/{id}' do
    patch('Allows for a specific contact to be updated. The contact ID must be included in the path. In the body of the request only include an object with fields that you wish to update') do
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
      response(200, 'Update successful') do
        run_test!
      end

      response(422, "Unprocessable Entity") do
        run_test!
      end
    end
  end

  path '/users/{user_id}/contacts/{id}' do
    delete(
      'Deletes the contact found under the ID provided in the endpoint'
    ) do
      tags 'Contact'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :id, in: :path, required: true

      response(200, 'Contact <CONTACT NAME> deleted') do
        run_test!
      end

      response(404, 'Not Found') do
        run_test!
      end
    end
  end

end

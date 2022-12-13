require 'swagger_helper'

RSpec.describe 'Provides Log data for a given User and Contact ID', type: :request do

  path '/users/{user_id}/contacts/{contact_id}/logs' do
    get(
      'Provides all logs for the contact found using the provided contact id within the endpoint'
    ) do
      tags 'Log'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :contact_id, in: :path, required: true
      response(200, '') do
        run_test!
      end
      response(404, 'Not Found') do
        run_test!
      end
    end
  end

  path '/users/{user_id}/contacts/{contact_id}/logs' do
    post(
      'Allows for a log to be created under the user account found within the authorization credentials. In the body of the request only include an object with fields that you wish to update. Subject & Body fields must be provided and they cannot be null or blank'
    ) do
      tags 'Log'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :contact_id, in: :path, required: true
      parameter name: :log, in: :body, schema: {
        type: :object,
          properties: {
            subject: { type: :string },
            body: { format: :string }
          },
          required: %w[subject]
      }
      response(200, 'New interaction log created successfully') do
        run_test!
      end
      response(422, "Unprocessable Entity") do
        run_test!
      end
    end
  end

  path '/users/{user_id}/contacts/{contact_id}/logs/{id}' do
    get('Provides the details of the Log ID provided in the endpoint') do
      tags 'Log'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :contact_id, in: :path, required: true
      parameter name: :id, in: :path, required: true

      response(200, '') do
        run_test!
      end

      response(404, "Unprocessable Entity") do
        run_test!
      end
    end
  end

  path '/users/{user_id}/contacts/{contact_id}/logs/{id}' do
    patch('Allows for a specific log to be updated. The contact ID must be included in the path. In the body of the request only include an object with fields that you wish to update') do
      tags 'Log'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :contact_id, in: :path, required: true
      parameter name: :id, in: :path, required: true
      parameter name: :log, in: :body, schema: {
        type: :object,
        properties: {
          subject: { type: :string },
          body: { format: :string }
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

  path '/users/{user_id}/contacts/{contact_id}/logs/{id}' do
    delete(
      'Deletes the contact found under the ID provided in the endpoint'
    ) do
      tags 'Log'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, required: true
      parameter name: :contact_id, in: :path, required: true
      parameter name: :id, in: :path, required: true

      response(200, 'Log record <LOG SUBJECT> deleted') do
        run_test!
      end

      response(404, 'Not Found') do
        run_test!
      end
    end
  end

end
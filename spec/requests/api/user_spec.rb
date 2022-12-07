require 'swagger_helper'

RSpec.describe 'User', type: :request do
  path '/login' do
    post(
      'Provides data on the User\'s basic account information and a list of all contacts logged in the database'
    ) do
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

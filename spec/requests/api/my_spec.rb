require 'swagger_helper'

RSpec.describe 'login', type: :request do
  # path '/login' do

    # get('logs user in') do
    #   response(200, 'successful') do

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  # before do
  #   @user = User.create(username: 'Henry')
  #   @user_id = @user.id
  #   @item = Item.create(name: 'MyItem', image: 'MyImage', description: 'This is my Item')
  #   @item_id = @item.id
  #   @booking = Booking.create(date: '12/02/2021', city: 'Madrid', user_id: @user_id, item_id: @item_id)
  #   @booking_id = @booking.id
  # end

  path '/login' do
    post('log in') do
      tags 'User'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              email: { type: :string },
              password: { format: :string },
            },
          },
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

  # path '/api/v1/bookings/{id}' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   get('show booking') do
  #     tags 'Bookings'
  #     response(200, 'successful') do
  #       let(:id) { @booking_id }
  #       run_test!
  #     end
  #   end

  #   delete('delete booking') do
  #     tags 'Bookings'
  #     response(204, 'successful') do
  #       let(:id) { @booking_id }
  #       run_test!
  #     end
  #   end
  # end

  # path '/api/v1/bookings/user' do
  #   post('get all user bookings') do
  #     tags 'Bookings'
  #     consumes 'application/json'
  #     parameter name: :booking, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         user_id: { type: :integer }
  #       },
  #       required: ['user_id']
  #     }
  #     response(200, 'successful') do
  #       let(:booking) { { booking: { user_id: @user_id } } }
  #       run_test!
  #     end
  #   end
  # end
end
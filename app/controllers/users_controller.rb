class UsersController < ApplicationController
  def index
    render json: { user: User.all }, status: :ok
  end
end

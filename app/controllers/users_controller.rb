class UsersController < ApplicationController
  def index
    render json: { user: User.all }, status: :ok
  end

  def show
    render json: { user: current_user }, status: :ok
  end
end

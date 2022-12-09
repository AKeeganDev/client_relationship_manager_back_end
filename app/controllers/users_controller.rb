class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_content_type_json, only: [:show]

  def show
    @user = {
      id: current_user.id,
      name: current_user.name,
      username: current_user.username
    }

    render json: { user: @user, contacts: current_user.contacts }, status: :ok
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :username, :email)
  end
end

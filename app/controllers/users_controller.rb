class UsersController < ApplicationController
  def index
    render json: { user: current_user.first_five_contacts, contacts: current_user.first_five_contacts }, status: :ok
  end

  def show
    render json: { user: current_user.contacts }, status: :ok
  end

  def update
    @user = current_user
    @user.update(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :username, :email)
  end
end

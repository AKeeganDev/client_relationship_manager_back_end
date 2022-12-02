class UsersController < ApplicationController
  # before_action :authenticate_user!

  # def index
  #   render json: { user: current_user, contacts: current_user.first_five_contacts }, status: :ok
  # end

  def show
    # @user = User.find(params[:id])
    # render json: { user: @user, contacts: @user.contacts }, status: :ok
    render json: { user: current_user, contacts: current_user.contacts }, status: :ok
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

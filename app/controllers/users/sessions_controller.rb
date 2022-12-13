class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    email_included = resource.email.length > 0
    user_exists = User.find_by_email(email = resource.email) if resource.email.length > 0
    
    if current_user
      render json: {
        status: { code: 200, message: 'Logged in sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
      elsif user_exists
        render json: {
          status: 401,
          message: 'Invalid email or password. Please check your spelling and cases or reset your password'
        }, status: :unauthorized
      elsif user_exists.blank? && email_included
        render json: {
          status: 404,
          message: "No account found with email #{resource.email}. Please signup a new account to log in"
        }, status: :not_found
        elsif current_user.blank?
          render json: {
            status: 403,
            message: 'Unauthorized request. Check your authorization credentials'
          }, status: :forbidden
        end
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: 'logged out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end

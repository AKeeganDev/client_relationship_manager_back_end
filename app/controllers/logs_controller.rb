class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :contact, only: %i[index show create update]
  before_action :log, only: [:destroy]
  before_action :deny_content_type_json, only: [:index, :show, :delete]

  def index
    @user = {
      id: current_user.id,
      name: current_user.name,
      username: current_user.username
    }

    render json: { user: @user, contact: @contact, logs: @contact.logs }, status: :ok
  end

  def show
    @log = @contact.logs.find(params[:id])
    render json: { contact: @contact, log: @log }, status: :ok
  end

  def create
    @new_log = Log.new(log_params)
    @new_log.contact = @contact
    if @new_log.save
      render json: { message: 'New interaction log created successfully', log: @new_log }, status: :ok
    else
      render json: @new_log.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @log.destroy
      render json: { log: @log, message: "Log record '#{@log.subject}' deleted" }
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  def update
    @log = @contact.logs.find(params[:id])
    if @log.update(log_params)
      render json: { log: @log, message: 'Update successful' }
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  private

  def contact
    @contact = current_user.contacts.find(params[:contact_id])
  end

  def log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:subject, :body)
  end
end

class LogsController < ApplicationController

  before_action :contact, only: [:index, :show, :create, :update]
  before_action :log, only: [:destroy]

  def index
    render json: { user: current_user, contact: @contact, logs: @contact.logs }, status: :ok
  end

  def show
    @log = @contact.logs.find(params[:id])
    render json: { contact: @contact, log: @log }, status: :ok
  end

  def create
    @newLog = Log.new(log_params)
    @newLog.contact = @contact
    if @newLog.save
      render json: { message: 'new interaction log created successfully', log: @newLog }, status: :ok
    else
      render json: @newLog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @log.destroy
      render json: { log: @log, message: "contact record '#{@log.subject}' deleted" }
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  def update
    @log = @contact.logs.find(params[:id])
    if @log.update(log_params)
      render json: { log: @log, message: 'update successful' }
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
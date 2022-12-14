class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :contact, only: %i[show destroy update]
  before_action :deny_content_type_json, only: %i[index show delete]

  def index
    render json: { contacts: current_user.contacts.all }, status: :ok
  end

  def show
    render json: { contact: @contact }, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      render json: { message: 'Contact created successfully', contact: @contact }, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      render json: { contact: @contact, message: "Contact record #{@contact.name} deleted" }
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if contact.update(contact_params)
      render json: { contact: @contact, message: 'Update successful' }
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private

  def contact
    @user = current_user
    @contact = @user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :email)
  end
end

class ContactsController < ApplicationController
  def index
    render json: { contacts: Contact.all }, status: :ok
  end

  def show; end

  def create; end

  def destroy; end

  def update; end
end

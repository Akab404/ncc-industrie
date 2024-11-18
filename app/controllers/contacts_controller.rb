class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    # raise
    if @contact.deliver
      redirect_to root_path, status: :created

      # raise
    else
      render :new, status: :unprocessable_entity
    end
  end

end

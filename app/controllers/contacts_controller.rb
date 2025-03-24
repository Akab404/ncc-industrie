class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request

    if @contact.deliver
      flash[:notice] = "Votre message a bien été envoyé."
      redirect_to root_path, status: :see_other
    else
      flash.now[:alert] = "Une erreur est survenue, veuillez réessayer."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end

end

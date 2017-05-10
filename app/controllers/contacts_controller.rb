class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.request = request
    if @contact.deliver!
      flash.keep[:notice] = "Your message has been sent! Thank you!"
      redirect_to '/'
    else
      render :new
    end
  end

  def contacts_params
    params.require(:contact).permit(:name, :email, :message)
  end
end

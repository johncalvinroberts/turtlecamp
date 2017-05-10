class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.request = request
    if @contact.deliver!
      redirect_to '/'
      flash.now[:notice] = 'Thank you for your message!'
    else
      render :new
    end
  end

  def contacts_params
    params.require(:contact).permit(:name, :email, :message)
  end
end

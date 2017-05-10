class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.request = request
    if @contact.deliver!
      flash[:alert] = 'Thank you for your message! We will get back to you soon.'
      redirect_to root_path
    else
      render :new
    end
  end

  def contacts_params
    params.require(:contact).permit(:name, :email, :message)
  end
end

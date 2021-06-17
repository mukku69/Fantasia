class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      ContactMailer.contact_mail(current_user, @contact).deliver
      redirect_to complete_contacts_path
      flash[:notice] = "お問合せありがとうございます。"
    else
      render :new
    end
  end

  def complete
  end

  private

  def contact_params
    params.require(:contact).permit(:body)
  end

end

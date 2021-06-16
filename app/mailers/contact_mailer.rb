class ContactMailer < ApplicationMailer

  def contact_mail(user, contact)
    @name = user.name
    @email = user.email
    @contact = contact
    mail to: ENV['CONTACT_MAIL'], subject: 'お問い合わせ'
  end

end

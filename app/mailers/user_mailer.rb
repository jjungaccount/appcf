class UserMailer < ApplicationMailer
  default from: "ambient.solace@yahoo.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
      :to => 'ambient.solace@yahoo.com',
      :subject => "A new contact form message from #{name}")
  end
end
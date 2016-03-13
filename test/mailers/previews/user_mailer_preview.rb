# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form('ambient.solace@yahoo.com', 'Jake', 'Hey there')
  end
  def welcome
    @user = User.find(1)
    UserMailer.welcome(@user)
  end
end
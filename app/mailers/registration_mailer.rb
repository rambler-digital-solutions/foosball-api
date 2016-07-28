class RegistrationMailer < ApplicationMailer
  def invite(user)
    @confirmation_code = user.confirmation_code
    mail(to: user.email, subject: 'You were invited to the Foosball app!')
  end

  def send_password(user, password)
    @password = password
    mail(to: user.email, subject: 'Thanks for confirming email!')
  end
end

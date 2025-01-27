class UserMailer < ApplicationMailer
  default from: "no-reply@gestioneventos.com"

  def send_invitation(email, event_id)
    @url = "localhost:3000/events/#{event_id}"

    mail(to: email, subject: "Te han invitado a un evento")
  end
end

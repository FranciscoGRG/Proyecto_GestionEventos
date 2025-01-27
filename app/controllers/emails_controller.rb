class EmailsController < ApplicationController
  def send_email
    user_email = params[:email]
    event_id = params[:event_id]

    @event = Event.find_by(id: event_id)

    UserMailer.send_invitation(user_email, event_id).deliver_now
    redirect_to event_path(@event), notice: "Correo enviado exitosamente a #{user_email}"
  end
end

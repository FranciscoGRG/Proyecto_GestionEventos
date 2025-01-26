class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.attended_events
  end

  def create
    event = Event.find(params[:event_id])
    if current_user.attended_events.include?(event)
      flash[:alert] = "Ya estas registrado para este evento"
    else
      current_user.attended_events << event
      flash[:notice] = "Te has registrado exitosamente para el evento"
    end
    redirect_to event_path(event)
  end

  def destroy
    attendance = Attendance.find_by(user_id: params[:user_id], event_id: params[:event_id])
    if attendance
      attendance.destroy
      flash[:notice] = "Has cancelado tu inscripción exitosamente"
      redirect_to event_path(params[:event_id])
    else
      flash[:alert] = "No se ha encontrado la participacion de este evento"
    end
  end
end

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
    
  end
end

class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit ]
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  def index
    @events = Event.where(visibility: true)
  end

  def show
    @event
  end

  def new
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to events_path, notice: "Tu Evento ha sido creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Tu evento se ha actualizado"
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def destroy
      if @event.user == current_user
        @event.destroy
        redirect_to events_path, notice: "Tu evento ha sido eliminado"
      else
        redirect_to events_path, alert: "No tienes permiso para eliminar este evento."
      end
   end

   def assist
    event = Event.find(params[:id])
    if current_user.attended_events.include?(event)
      flash[:alert] = "Ya estas registrado para este evento"
    else
      current_user.attended_events << event
      flash[:notice] = "Te has registrado exitosamente para el evento"
    end
    redirect_to event_path(event)
   end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date_time, :location, :visibility, :user_id)
  end

  def set_event
    @event ||= Event.find(params[:id])
  end
end

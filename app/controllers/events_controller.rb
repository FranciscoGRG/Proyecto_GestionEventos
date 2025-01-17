class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @events = Event.where(visibility: true)
  end

  def show
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

  def update
  end

  def destroy
  end

  def event_params
    params.require(:event).permit(:name, :description, :date_time, :location, :visibility, :user_id)
  end
end

class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)

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
    params.require(:event).permit(:name, :description, :date_time, :location, :visibility)
  end
end

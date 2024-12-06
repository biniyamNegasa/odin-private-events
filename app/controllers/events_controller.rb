class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create ]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.build_creator(id: current_user.id)

    if @event.save
      redirect_to @event, notice: "Event was created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:date, :location)
  end
end

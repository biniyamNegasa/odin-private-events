class AttendeeEventConnectorsController < ApplicationController
  before_action :authenticate_user!
  def new
    @event = Event.new
  end

  def create
    unless params[:attend_event].to_i.zero?
      @event = Event.find(params[:event_id])
      begin
        current_user.attended_events.find(params[:event_id])
      rescue ActiveRecord::RecordNotFound
        current_user.attended_events << @event
      end
      redirect_to @event, notice: "Attendee added Successfully"
    end
  end

  private
  def event_params
    params.permit(:event_id, :attend_event)
  end
end

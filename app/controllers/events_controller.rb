class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    # should replace User.first with current_user method
    # from application_controller
    @event = User.first.events.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit([:name, :location, :time])
  end
end

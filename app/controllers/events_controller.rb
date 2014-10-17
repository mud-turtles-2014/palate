class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      flash[:event_error] = @event.errors.full_messages
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @new_invite = EventWine.new
  end

  private
  def event_params
    params.require(:event).permit([:name, :location, :time])
  end
end

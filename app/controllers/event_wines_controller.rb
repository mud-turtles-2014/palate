class EventWinesController < ApplicationController
  def create
    # hard coding current_event and wine for now
    # but obviously need to change this
    # either pass info in via hidden form fields
    # or get info from url params
    current_event = Event.first
    wine = Wine.first
    @event_wine = EventWine.new(wine_bringer: params[:wine_bringer], wine: wine, event: current_event)

    if @event_wine.save
      redirect_to event_path(current_event)
    else
      flash[:event_wine_error] = @event_wine.errors.full_messages
      redirect_to event_path(current_event)
    end
  end
end

# Sample invitation creation format
# Event.first.event_wines.create(wine_bringer: User.first, wine: Wine first, is_attending: true)

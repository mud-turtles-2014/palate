class EventsController < ApplicationController
  before_action :get_event, only: [:show, :edit, :update, :destroy]

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

  def edit
    @current_user = User.find(@event.user_id)

    if @current_user!= User.find(session[:id])
      flash[:edit_error] = "You are not allowed to edit this event. Please ask the #{creator}"
      redirect_to event_path
    end
  end

  def update
    @event.update(event_params)
    redirect_to event_path
  end

  private

  def get_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit([:name, :location, :date, :time])
  end
end

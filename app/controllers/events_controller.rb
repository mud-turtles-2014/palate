class EventsController < ApplicationController
  before_action :get_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.new_record? && params[:emails].blank?
      flash[:alert] = "Can't add an event without emails!"
      render :new
    else
      invite_users

      if @event.save
        redirect_to event_path(@event)
      else
        flash[:event_error] = @event.errors.full_messages
        render :new
      end
    end
  end

  def show
  end

  def edit
    if current_user != User.find(session[:user_id])
      flash[:edit_error] = "You are not allowed to edit this event."
      redirect_to event_path
    end
  end

  def update
    invite_users

    @event.update(event_params)
    redirect_to event_path
  end

  def user_events
    if !current_user
      redirect_to '/login'
    else
      @upcoming_events = current_user.upcoming_events
      @past_events = current_user.past_events
    end
  end

  private

  # TODO: refactor into smaller methods
  def invite_users
    email_array = params[:emails].split(',')
    email_array.each do |email|
      existing_user = User.find_by(email: email)

      if existing_user != nil
        event_wine = EventWine.create(wine: nil,
                        event: @event,
                        wine_bringer: existing_user)
      else
        new_user = User.create(name: "Guest",
                              email: email,
                              password: "merlot1")
        event_wine = EventWine.create(wine: nil,
                        event: @event,
                        wine_bringer: new_user)
      end
      UserMailer.invite_email(email, event_wine).deliver!
    end
  end

  def get_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit([:name, :location, :date, :time])
  end
end

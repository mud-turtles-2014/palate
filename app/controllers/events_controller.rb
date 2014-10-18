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
      email_array = params[:emails].split(',')
      email_array.each do |email|
        event_wine = EventWine.create(wine: nil,
                          event: @event,
                          wine_bringer: nil)
        UserMailer.invite_email(email, event_wine).deliver!
      end

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
    email_array = params[:emails].split(',')
    email_array.each do |email|
      event_wine = EventWine.create(wine: nil,
                                  event: @event,
                                  wine_bringer: nil)
      UserMailer.invite_email(email, event_wine).deliver!
    end
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

  def show_quiz
    # TO DO: refactor into model methods
    # change each enumerator to a map
    @event = Event.find(params[:id])
    all_wines = @event.winelist
    tasted_wines_tastings = Tasting.joins(:event_wine).where('event_wines.event_id = ?', @event.id).where(user: current_user).to_a
    tasted_wines = []
    tasted_wines_tastings.each do |tasting|
      tasted_wines << tasting.event_wine.wine
    end
    untasted_wines = all_wines - tasted_wines
    @wine = untasted_wines[0]
    @event_wine = EventWine.where(event: @event).where(wine: @wine)[0]
    @tasting = Tasting.new
    redirect_to event_path(@event) unless @wine
  end

  private
  def get_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit([:name, :location, :date, :time])
  end
end

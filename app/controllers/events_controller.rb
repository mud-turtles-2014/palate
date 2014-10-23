class EventsController < ApplicationController
  before_action :get_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.new_record? && params[:emails].blank?
      flash[:alert] = "Please include email addresses for guests!"
      render :new
    else
      if @event.save
        creator_wine = Wine.all.sample
        EventWine.create!(event: @event, wine_bringer: current_user, wine: creator_wine, is_attending: true)

        invite_users
        redirect_to event_path(@event)
      else
        flash[:event_error] = @event.errors.full_messages
        render :new
      end
    end
  end

  def show
    @event_wine = EventWine.find_by(wine_bringer: current_user, event: @event)
    @attend
    # only redirects if no current user or the user is not is_attending: true
    if !current_user || !current_user.event_wines.where(is_attending: true)
      redirect_to '/my_events'
    end
  end

  def edit
    if !current_user
      redirect_to '/'
    elsif current_user.id != @event.user_id
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

  def make_graph_data result_hash
     result_hash[:user_results].each do |k, v|
      user_answer = v
      correct_answer = result_hash[:correct_answers][k]
      if user_answer == correct_answer
        attribute_score = @graph_data[k]
        attribute_score += 1
        @graph_data[k] = attribute_score
      end
    end
  end

  # def make_super_graph super_hash
  #   correct_answers.each do |k, v|
  #     super_score = @super_graph[k]
  #     super_score += 1
  #     @super_graph[k] = super_score
  #   end
  # end

  def user_scores
    if !current_user
      redirect_to '/login'
    else
      @event = Event.find(params[:id])
      @user_tastings = Tasting.where(event_wine: EventWine.where(event: @event), user: current_user)
      @score_report = []
      @graph_data = Hash.new(0)
      # @super_graph = Hash.new(0)
      @user_tastings.each do |tasting|
        @score_report << tasting.score_report
        make_graph_data tasting.score_report
      end
      render :layout => "quiz"
    end
  end

  def show_quiz
    # TO DO: refactor into model methods
    # change each enumerator to a map

    set_user_from_email_invite
    redirect_to '/' unless current_user

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
    @wine_bringer = @event_wine.wine_bringer.name_or_email if @event_wine
    @tasting = Tasting.new
    if @wine
      render :layout => "quiz"
    else
      redirect_to "/events/#{@event.id}/my_results", :layout => "quiz"
    end
  end

  def destroy
    @event.delete
    redirect_to my_events_path(session[:user_id])
  end

  private

  # TODO: refactor into smaller methods
  def invite_users
    email_array = params[:emails].split(',')
    email_array.each do |email|
      existing_user = User.find_by(email: email)

      if existing_user
        event_wine = EventWine.create(wine: @event.assign_unique_wine,
                        event: @event,
                        wine_bringer: existing_user)
      else
        new_user = User.create(name: "Guest",
                              email: email,
                              password: "merlot1")
        event_wine = EventWine.create(wine: @event.assign_unique_wine,
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

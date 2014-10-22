class EventWinesController < ApplicationController
  before_action :get_event_wine

	def edit
    set_user_from_email_invite
    redirect_to '/' unless current_user
    
    if @event_wine.is_attending != nil
			redirect_to my_events_path
		end
  end

  def update
  	@event_wine.update(event_wine_params)

    if @event_wine.is_attending
  	 redirect_to event_wine_path(@event_wine)
    else
      redirect_to '/'
    end
  end

  def show
  end

  private

  def get_event_wine
    @event_wine = EventWine.find(params[:id])
  end

  def event_wine_params
    params.require(:event_wine).permit([:event, :wine_id, :wine_bringer, :is_attending])
  end
end

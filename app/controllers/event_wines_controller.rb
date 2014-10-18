class EventWinesController < ApplicationController
  before_action :get_event_wine

	def edit
		if @event_wine.is_attending
			redirect_to :index
		else
			event = @event_wine.event
			all_wines = Wine.all
			event_wine_list = event.winelist

			unassigned = all_wines - event_wine_list

			@my_wine = unassigned.sample
		end
  end

  def update
  	@event_wine.update(event_wine_params)
  	redirect_to event_wine_path(@event_wine)
  end

  def show
  end

  private

  def get_event_wine
    @event_wine = EventWine.find(params[:id])
  end

  def event_wine_params
    params.require(:event_wine).permit([:event, :wine_id, :wine_bringer])
  end
end

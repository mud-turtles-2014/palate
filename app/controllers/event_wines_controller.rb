class EventWinesController < ApplicationController
  before_action :get_event_wine

	def edit
  end

  def update
  end

  private

  def get_event_wine
    @event_wine = EventWine.find(params[:id])
  end
end

class TastingsController < ApplicationController

  # redirect back to events show_quiz method
  def create
    event_wine = EventWine.find(params[:event_wine_id])
    event = event_wine.event
    tasting = current_user.tastings.create(tasting_params)

    redirect_to "/events/#{event.id}/quiz"
  end

  private
  def tasting_params
    params.permit([:event_wine_id, :red_fruits, :white_fruits, :fruit_condition, :minerality, :oak, :dry, :acid, :tannin, :alcohol, :climate, :country, :red_grape, :white_grape, :tasting_notes])
  end
end

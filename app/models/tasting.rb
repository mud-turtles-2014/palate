class Tasting < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_wine
  has_one :wine, through: :event_wine
  has_one :event, through: :event_wine

  enum red_fruits: { red: 1, blue: 2, black: 3}
  enum white_fruits: { apple_pear: 1, stone: 2, citrus: 3, tropical: 4}
  enum fruit_condition: { tart: 1, under_ripe: 2, ripe: 3, over_ripe: 4, jammy: 5 }
  enum climate: { cool: 1, warm: 2}
  enum country: { france: 1, italy: 2, us: 3, australia: 4, argentina: 5, germany: 6, new_zealand: 7 }
  enum red_grape: { gamay: 1, cabernet_sauvignon: 2, merlot: 3, malbec: 4, syrah_shiraz: 5, pinot_noir: 6, sangiovese: 7, nebbiolo: 8, zinfandel: 9 }
  enum white_grape: { chardonnay: 1, sauvignon_blanc: 2, riesling: 3, chenin_blanc: 4, viognier: 5, pinot_grigio: 6, riesling: 7 }

  def raw_score(current_wine)
    score = 0

    # pascaline's super user tastings
    super_tastings = Tasting.where(event_wine: User.first.event_wines.where(event: Event.first))
    pascaline_wine = super_tastings.find_by(event_wine: EventWine.find_by(wine: current_wine))#Wine.find_by(name: wine.name)))

    score += 1 if self.red_fruits == pascaline_wine.red_fruits
    # score += 1 if self.white_fruits == pascaline_wine.white_fruits
    score += 1 if self.fruit_condition == pascaline_wine.fruit_condition
    score += 1 if self.minerality == pascaline_wine.minerality
    score += 1 if self.oak == pascaline_wine.oak
    score += 1 if self.dry == pascaline_wine.dry
    score += 1 if self.acid == pascaline_wine.acid
    score += 1 if self.tannin == pascaline_wine.tannin
    score += 1 if self.alcohol == pascaline_wine.alcohol
    score += 1 if self.climate == pascaline_wine.climate
    score += 1 if self.country == pascaline_wine.country
    score += 1 if self.red_grape == pascaline_wine.red_grape
    # score += 1 if self.white_grape == pascaline_wine.white_grape
    return score
  end

  # def current_wine
  #   self.wine.name
  # end
end

# all event wines for the current wine
# current_wine = "French Gamay"
# EventWine.find_by(wine: Wine.find_by(name: current_wine))

# all event wines for super user event
# super_event = User.first.event_wines.where(event: Event.first)
# super_event.where(wine: Wine.find_by(name: "French Gamay"))[0]

# returns a tasting that seems to be the correct one
# not sure why
# Tasting.find_by(event_wine: User.first.event_wines.where(event: Event.first))

# returns all pascaline's tastings from her super event
# super_tastings = Tasting.where(event_wine: User.first.event_wines.where(event: Event.first))
# returns the tasting for the given wine
# current_wine = "French Gamay"
# wine = super_tastings.find_by(event_wine: EventWine.find_by(wine: Wine.find_by(name: current_wine)))
# wine.red_fruits => "red"
# etc ...





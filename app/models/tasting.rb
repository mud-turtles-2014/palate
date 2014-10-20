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
    # super user tastings
    super_tastings = Tasting.where(event_wine: User.first.event_wines.where(event: Event.first))
    super_tasting = super_tastings.find_by(event_wine: EventWine.find_by(wine: Wine.find_by(name: self.wine.name))) #current_wine))

    raw_score = 0
    correct_categories = current_tasting_attributes
    incorrect_categories = []

    current_tasting_attributes.each do |attribute|
      if self.send(attribute) == super_tasting.send(attribute)
        raw_score += 1
        UserResult.create(tasting: self, is_correct: true, category: attribute.to_s)
      else
        incorrect_categories.push(correct_categories.delete(attribute))
        UserResult.create(tasting: self, is_correct: false, category: attribute.to_s)
      end
    end

    score = "#{raw_score} / #{current_tasting_attributes.length}"
    formatted_correct = formatted_categories(correct_categories)
    formatted_incorrect = formatted_categories(incorrect_categories)
    user_guess = wine_color == "white" ? self.white_grape : self.red_grape
    user_guess = format_category(user_guess)
    correct_wine = wine_color == "white" ? super_tasting.white_grape : super_tasting.red_grape
    correct_wine = format_category(correct_wine)

    return {score: score, correct: formatted_correct, incorrect: formatted_incorrect, user_guess: user_guess, correct_wine: correct_wine}
  end

  def formatted_categories(categories)
    categories.map! do |category|
      format_category(category)
    end
  end

  def format_category(category)
    category.to_s.sub("red_","").sub("white_","").sub("_"," ").split.map(&:capitalize).join(' ')
  end

  def current_tasting_attributes
    wine_color == "white" ? white_tasting_attributes : red_tasting_attributes
  end

  def wine_color
    self.wine.color
  end

  def parse_tasting_attributes
    all_attributes = Tasting.last.attributes.map {|attribute, val| attribute}
    wine_attributes = all_attributes.reject {|attribute| /(_id|_at|\bid)/.match(attribute)}
    wine_attributes.map! {|attribute| attribute.to_sym}
  end

  def red_tasting_attributes
    parse_tasting_attributes.reject {|attribute| /(white_)/.match(attribute)}
  end

  def white_tasting_attributes
    parse_tasting_attributes.reject {|attribute| /(red_|tannin)/.match(attribute)}
  end
end


# self.send(:white_fruits)

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





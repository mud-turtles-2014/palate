class Tasting < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_wine
  has_one :wine, through: :event_wine
  has_one :event, through: :event_wine

  enum red_fruits: { red: 1, blue: 2, black: 3}
  enum white_fruits: { apple_pear: 1, stone: 2, citrus: 3, tropical: 4}
  enum fruit_condition: { tart: 1, under_ripe: 2, ripe: 3, over_ripe: 4, jammy: 5 }
  enum climate: { cool: 1, warm: 2}
  enum country: { france: 1, italy: 2, united_states: 3, australia: 4, argentina: 5, germany: 6, new_zealand: 7 }
  enum red_grape: { gamay: 1, cabernet_sauvignon: 2, merlot: 3, malbec: 4, syrah_shiraz: 5, pinot_noir: 6, sangiovese: 7, nebbiolo: 8, zinfandel: 9 }
  enum white_grape: { chardonnay: 1, sauvignon_blanc: 2, riesling: 3, chenin_blanc: 4, viognier: 5, pinot_grigio: 6, riesling: 7 }

  FRUITS_FEEDBACK = "Each grape varietal has its own characteristic fruit profile. It's not easy to choose the fruit category that most defines a wine. Only more tasting experience can solidify that link."
  MINERALITY_FEEDBACK = "Minerality can fall into inorganic (stone, crushed rock or organic (earth, clay) categories."
  OAK_FEEDBACK = "Oak imparts characteristic vanilla and baking spice notes to wine. It also makes wines slightly more textural."
  DRY_FEEDBACK = "Dryness simply refers to the lack of sugar in a wine. Is there any lingering sweetness on your tongue? If so, chances are the wine isn't dry."
  ACID_FEEDBACK = "How much saliva is pooling in your mouth after you sip? The more saliva pooling means a higher acid wine. Sounds strange, but it works."
  TANNIN_FEEDBACK = "Tannins are compounds found in grape skins that cause the sensation of friction in your mouth. If you feel a lot of grip on your tongue, those are tannins."
  ALCOHOL_FEEDBACK = "Alcohol can be hard to detect accurately. Exhale after you taste. The hotter your throat feels, the higher the alcohol probably is."
  FRUIT_CONDITION_FEEDBACK = "This is somewhat linked to acid and alcohol. Does the wine tast tart (highly acidic) or is the wine ripe and jammy (highly alcoholic). Sugar gets converted to alcohol, so riper grapes produce more alcoholic wine."

  def get_super_tasting(grape, country)
    super_tastings = Tasting.where(event_wine: User.first.event_wines.where(event: Event.first))
    super_tasting = super_tastings.find_by(event_wine: EventWine.find_by(wine: Wine.find_by(grape: grape, country: country)))
  end

  def score_report
    super_tasting = get_super_tasting(self.wine.grape, self.wine.country)

    attributes = current_tasting_attributes
    user_results = {}
    correct_answers = {}

    attributes.each do |attribute|
      user_results[format_category(attribute)] = format_category(self.send(attribute))
      correct_answers[format_category(attribute)] = format_category(super_tasting.send(attribute))
    end
    wine_bringer = self.event_wine.wine_bringer.name_or_email

    conclusion_score = is_reasonable_conclusion
    observation_score = is_reasonable_observation
    feedback_hash = get_feedback_hash

    return { user_results: user_results, correct_answers: correct_answers, wine_bringer: wine_bringer, conclusion_score: conclusion_score, observation_score: observation_score, feedback_hash: feedback_hash }
  end

  def get_feedback_hash
    feedback_hash = {}
    incorrect_categories.each do |category|
      case category
      when "Minerality"
        feedback_hash[category] = MINERALITY_FEEDBACK
      when "Oak"
        feedback_hash[category] = OAK_FEEDBACK
      when "Dry"
        feedback_hash[category] = DRY_FEEDBACK
      when "Acid"
        feedback_hash[category] = ACID_FEEDBACK
      when "Alcohol"
        feedback_hash[category] = ALCOHOL_FEEDBACK
      when "Minerality"
        feedback_hash[category] = MINERALITY_FEEDBACK
      when "Fruit Condition"
        feedback_hash[category] = FRUIT_CONDITION_FEEDBACK
      when "Fruits"
        feedback_hash[category] = FRUITS_FEEDBACK
      end
    end
    return feedback_hash
  end

  # can use to return correct categories too
  def incorrect_categories
    super_tasting = get_super_tasting(self.wine.grape, self.wine.country)
    correct_categories = attributes_stored_by_int
    incorrect_categories = []

    attributes_stored_by_int.each do |attribute|
      if self[attribute] != super_tasting[attribute]
        incorrect_categories.push(correct_categories.delete(attribute))
      end
    end
    formatted_incorrect = formatted_categories(incorrect_categories)

    return formatted_incorrect
  end

  # use euclidian distance to find accuracy of observations
  # comparing against super_user tastings

  # TODO
  # add ability to track problem categories
  # and strength categories
  def score_observations
    super_tasting = get_super_tasting(self.wine.grape, self.wine.country)

    get_euclidian_dist(super_tasting)
  end

  def get_euclidian_dist(tasting)
    sum = 0

    attributes_stored_by_int.each do |attribute|
      sum += (tasting[attribute] - self[attribute])**2
    end

    euclidian_dist = Math.sqrt(sum)
  end

  # shows distance from user's observations to user's selected wine
  def score_observations_against_guessed_wine
    if self.wine.color == "red"
      guessed_grape = format_category(self.red_grape)
    else
      guessed_grape = format_category(self.white_grape)
    end
    guessed_country = format_category(self.country)
    super_tasting = get_super_tasting(guessed_grape, guessed_country)
    return 6.0 if !super_tasting

    get_euclidian_dist(super_tasting)
  end

  def is_reasonable_conclusion
    is_reasonable(score_observations_against_guessed_wine)
  end

  def is_reasonable_observation
    is_reasonable(score_observations)
  end

  def is_reasonable(response)
    puts response
    if response <= 0.5
      return "Master Somm Level"
    elsif response <= 1.5
      return "Junior Somm Level"
    elsif response <= 2.5
      return "Solid"
    elsif response <= 3.5
      return "Alright"
    else
      return "Errr, not the best"
    end
  end

  def attributes_stored_by_int
    attributes = [:minerality, :oak, :dry, :acid, :alcohol, :fruit_condition]
    if self.wine.color == "red"
      attributes + [:tannin, :red_fruits]
    else
      attributes << :white_fruits
    end
    attributes
  end

  def formatted_categories(categories)
    categories.map! do |category|
      format_category(category)
    end
  end

  def format_category(category)
    return convert_num_to_category(category) if category.to_s.match(/\b\d\b/)
    category.to_s.sub("red_","").sub("white_","").sub("_"," ").split.map(&:capitalize).join(' ')
  end

  def convert_num_to_category(category)
    category = category.to_s.to_i
    if category == 1
      return "Low"
    elsif category == 2
      return "Med-Minus"
    elsif category == 3
      return "Med"
    elsif category == 4
      return "Med-Plus"
    elsif category == 5
      return "Hi"
    end
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



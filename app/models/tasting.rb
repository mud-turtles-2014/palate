class Tasting < ActiveRecord::Base
  include Feedback

  belongs_to :user
  belongs_to :event_wine
  has_one :wine, through: :event_wine
  has_one :event, through: :event_wine

  enum red_fruits:      [:red, :blue, :black]
  enum white_fruits:    [:citrus, :stone, :tropical]
  enum fruit_condition: [:tart, :under_ripe, :ripe, :over_ripe, :jammy]
  enum climate:         [:cool, :warm]
  enum country:         [:france, :italy, :united_states, :australia, :argentina, \
                        :germany, :new_zealand]
  enum red_grape:       [:gamay, :cabernet_sauvignon, :merlot, :malbec, :syrah_shiraz, \
                        :pinot_noir, :sangiovese, :nebbiolo, :zinfandel]
  enum white_grape:     [:chardonnay, :sauvignon_blanc, :riesling, :chenin_blanc, \
                        :viognier, :pinot_grigio]    

  def get_super_tasting(grape, country)
    current_event_wine = User.first.event_wines.where(event: Event.first) 
    super_tastings = Tasting.where(event_wine: current_event_wine)
    current_wine = Wine.find_by(grape: grape, country: country)
    super_event_wine = EventWine.find_by(wine: current_wine) 
    super_tasting = super_tastings.find_by(event_wine: super_event_wine)
  end

  def score_report
    super_tasting = get_super_tasting(self.wine.grape, self.wine.country)

    attributes = current_tasting_attributes
    user_results = {}
    correct_answers = {}

    user_conclusions = {}
    correct_conclusions = {}

    attributes.each do |attribute|
      # if array of conclusions does not include attribute
      # ~~~use hash instead of arr here
      if !conclusion_attr_hash[attribute]
        # OBSERVATION ATTRS
        # set user_results["Red Fruits"] to {text_response: user_ans, num_response: user_num}
        user_results[format_category(attribute)] = make_result_hash(attribute, self)
        # set correct_answers["Red Fruits"] to {text_response: super_ans, num_response: super_num}
        correct_answers[format_category(attribute)] = make_result_hash(attribute, super_tasting)
      else
        # CONCLUSION ATTRS
        # ~~~add micrograph height to user_answer and and correct_answer
        # ~~~view needs to check if they're equal and then display micrographs
        # ~~~or check mark if equal
        # set user_results["Red Fruits"] to user_answer
        user_conclusions[format_category(attribute)] = format_category(self.send(attribute))
        # set correct_conclusions["Red Fruits"] to correct_answer
        correct_conclusions[format_category(attribute)] = format_category(super_tasting.send(attribute))
      end
    end

    wine_bringer = self.event_wine.wine_bringer.name_or_email

    conclusion_score = is_reasonable_conclusion

    # calling is_reasonable_observation
    # which calls is_reasonable 
    # on score_observations
    # which gets the super_tasting
    # and calls get_euclidian_dist on the super_tasting
    # which sums the dist bw the super user num and self num
    # for each attributes_stored_by_int
    # ~~~replace attributes_stored_by_int
    # ~~~with a hash like conclusion_attr_array
    observation_score = is_reasonable_observation

    # calls get_observation_feedback
    # which calls incorrect_categories
    # which returns an array
    # that adds feedback constant msgs
    # to a hash that looks like:
    # {"Minerality": feedback_constant, ..}
    observation_feedback = get_observation_feedback
    conclusion_feedback = get_problem_categories(get_super_tasting_for_guessed_wine, conclusion_score)

    # take conclusions out of user_results and correct_answers
    return { user_results: user_results, correct_answers: correct_answers, wine_bringer: wine_bringer, conclusion_score: conclusion_score, observation_score: observation_score, user_conclusions: user_conclusions, correct_conclusions: correct_conclusions, observation_feedback: observation_feedback, conclusion_feedback: conclusion_feedback}
  end

  def conclusion_attr_hash
    {white_grape: 1, red_grape: 1, country: 1, climate: 1}
  end

  def make_result_hash(attribute, tasting)
    if attribute == :red_fruits || attribute == :white_fruits || attribute == :climate || attribute == :country || attribute == :white_grape || attribute == :red_grape
      { text_response: format_category(tasting.send(attribute)), num_response: 0 }
    else
      { text_response: format_category(tasting.send(attribute)), num_response: tasting[attribute] }
    end
  end

  def get_problem_categories(tasting, reasonability)
    return nil if !tasting
    return nil unless reasonability == "Alright" || reasonability == "Errr, not the best"
    problem_categories = []

    attributes_stored_by_int

    attributes_stored_by_int.each do |attribute|
      if (tasting[attribute] - self[attribute]).abs > 1
        problem_categories << { category: format_category(attribute), correct_response: convert_num_to_category(tasting.send(attribute)).downcase }
      end
    end

    return problem_categories
  end

  def get_conclusion_feedback(reasonability)
    if reasonability == "Alright" || reasonability == "Errr, not the best"
      GUIDANCE[get_super_tasting_for_guessed_wine.wine.name]
    end
  end

  def get_observation_feedback
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

  def get_super_tasting_for_guessed_wine
    if self.wine.color == "red"
      guessed_grape = format_category(self.red_grape)
    else
      guessed_grape = format_category(self.white_grape)
    end
    guessed_country = format_category(self.country)
    super_tasting = get_super_tasting(guessed_grape, guessed_country)
  end

  # shows distance from user's observations to user's selected wine
  def score_observations_against_guessed_wine
    super_tasting = get_super_tasting_for_guessed_wine

    return 7.0 if !super_tasting

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
    elsif response <= 6.0
      return "Errr, not the best"
    else
      return "Not enough information"
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
    category = category.to_s
    if category == "1"
      return "Low"
    elsif category == "2"
      return "Med-Minus"
    elsif category == "3"
      return "Med"
    elsif category == "4"
      return "Med-Plus"
    elsif category == "5"
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
    wine_attributes = all_attributes.reject {|attribute| /(_id|_at|\bid|tasting_notes|is_blind)/.match(attribute)}
    wine_attributes.map! {|attribute| attribute.to_sym}
  end

  def red_tasting_attributes
    parse_tasting_attributes.reject {|attribute| /(white_)/.match(attribute)}
  end

  def white_tasting_attributes
    parse_tasting_attributes.reject {|attribute| /(red_|tannin)/.match(attribute)}
  end
end



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
    report = {}
    super_tasting = get_super_tasting(self.wine.grape, self.wine.country)
    guessed_tasting = get_guessed_tasting
    attributes = current_tasting_attributes
    user_results = {}
    correct_answers = {}
    user_conclusions = {}
    correct_conclusions = {}
    observation_dist = 0 
    conclusion_dist = 0
    observation_feedback = {}
    conclusion_feedback = []

    attributes.each do |attribute|
      formatted_attr = format_category(attribute)
      if conclusion_attr_hash[attribute]
        # score conclusions
        user_conclusions[formatted_attr] = format_category(self.send(attribute))
        correct_conclusions[formatted_attr] = format_category(super_tasting.send(attribute))
      else
        # score observations
        user_results[formatted_attr] = make_result_hash(attribute, self)
        correct_answers[formatted_attr] = make_result_hash(attribute, super_tasting)     
        if numerical_attributes[attribute]
          user_num = user_results[formatted_attr][:num_response]
          correct_num = correct_answers[formatted_attr][:num_response]
          dist = (correct_num - user_num) ** 2
          observation_dist += dist
          if dist > 1
            observation_feedback[formatted_attr] = get_feedback(formatted_attr)
          end
          # score conclusions based on observations
          conclusion_num = guessed_tasting[attribute]
          dist = (conclusion_num - user_num) ** 2
          conclusion_dist += dist
          if dist > 1 &&  !formatted_attr.match("Fruits")
            correct_response = convert_num_to_category(guessed_tasting.send(attribute))
            conclusion_feedback << { category: formatted_attr, correct_response: correct_response }
          end
        end
      end
    end

    report[:wine_bringer] = self.event_wine.wine_bringer.name_or_email
    report[:conclusion_score] = is_reasonable(conclusion_dist)
    report[:observation_score] = is_reasonable(observation_dist)
    report[:user_results] = user_results
    report[:correct_answers] = correct_answers
    report[:user_conclusions] = user_conclusions
    report[:correct_conclusions] = correct_conclusions
    report[:observation_feedback] = observation_feedback
    report[:conclusion_feedback] = conclusion_feedback

    return report
  end

  def conclusion_attr_hash
    {white_grape: 1, red_grape: 1, country: 1, climate: 1}
  end

  def make_result_hash(attribute, tasting)
    if !numerical_attributes[attribute] || attribute.to_s.match("fruits")
      { text_response: format_category(tasting.send(attribute)), num_response: 0 }
    else
      { text_response: format_category(tasting.send(attribute)), num_response: tasting[attribute] }
    end
  end

  def get_feedback(category)
    case category
    when "Tannin"
      return TANNIN_FEEDBACK
    when "Minerality"
      return MINERALITY_FEEDBACK
    when "Oak"
      return OAK_FEEDBACK
    when "Dry"
      return DRY_FEEDBACK
    when "Acid"
      return ACID_FEEDBACK
    when "Alcohol"
      return ALCOHOL_FEEDBACK
    when "Minerality"
      return MINERALITY_FEEDBACK
    when "Fruit Condition"
      return FRUIT_CONDITION_FEEDBACK
    when "Fruits"
      return FRUITS_FEEDBACK
    end
  end

  def get_guessed_tasting
    if self.wine.color == "red"
      guessed_grape = format_category(self.red_grape)
    else
      guessed_grape = format_category(self.white_grape)
    end
    guessed_country = format_category(self.country)
    super_tasting = get_super_tasting(guessed_grape, guessed_country)
  end

  def is_reasonable(raw_dist)
    euclidean_dist = Math.sqrt(raw_dist)
    if euclidean_dist <= 0.5
      return "Master Somm Level"
    elsif euclidean_dist <= 1.5
      return "Junior Somm Level"
    elsif euclidean_dist <= 2.5
      return "Solid"
    elsif euclidean_dist <= 3.5
      return "Alright"
    elsif euclidean_dist <= 6.0
      return "Errr, not the best"
    else
      return "Not enough information"
    end
  end

  def numerical_attributes
    attributes = {minerality: 1, oak: 1, dry: 1, acid: 1, alcohol: 1, fruit_condition: 1}

    if self.wine.color == "red"
      attributes[:tannin] = 1
      attributes[:red_fruits] = 1
    else
      attributes[:white_fruits] = 1
    end
    attributes
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
    self.wine.color == "white" ? white_tasting_attributes : red_tasting_attributes
  end

  def get_attributes
    Tasting.last.attributes.map {|attribute, val| attribute}
  end
 
  def red_tasting_attributes
    attributes = get_attributes
    attributes.reject! {|attribute| /(_id|_at|\bid|tasting_notes|is_blind|white_)/.match(attribute)}
    attributes.map! {|attribute| attribute.to_sym }
  end

  def white_tasting_attributes
    attributes = get_attributes
    attributes.reject! {|attribute| /(_id|_at|\bid|tasting_notes|is_blind|red_|tannin)/.match(attribute)}
    attributes.map! {|attribute| attribute.to_sym}
  end
end



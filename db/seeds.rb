Event.create!([
  {name: "Intro to Blind Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1}
])
EventWine.create!([
  {is_attending: nil, event_id: 1, wine_id: 1, user_id: 1}
])
Question.create!([
  {question: "fruits"},
  {question: "mineral"},
  {question: "mineral_level"},
  {question: "oak"},
  {question: "dry"},
  {question: "acid"},
  {question: "tannin", red_only: true},
  {question: "alcohol"},
  {question: "cool_climate"},
  {question: "old_world"},
  {question: "country"},
  {question: "grape"},
])
User.create!([
  {name: "steph", email: "stephtzhang@gmail.com", password: "test", password_confirmation: "test"}
])
Wine.create!([
  {name: "French Gamay", color: "red", description: "Gamay gets a bad rap, but Cru Beaujolais - from one of the 10 designated cru areas in the region - shows why the grape gets called the poor man's Pinot."}
])
WineQuestion.create!([
  {correct_answer: "red", question_id: 1, wine_id: 1},
  {correct_answer: "stone", question_id: 2, wine_id: 1},
  {correct_answer: "4", question_id: 3, wine_id: 1},
  {correct_answer: "false", question_id: 4, wine_id: 1},
  {correct_answer: "true", question_id: 5, wine_id: 1},
  {correct_answer: "2", question_id: 6, wine_id: 1},
  {correct_answer: "4", question_id: 7, wine_id: 1},
  {correct_answer: "4", question_id: 8, wine_id: 1},
  {correct_answer: "true", question_id: 9, wine_id: 1},
  {correct_answer: "true", question_id: 10, wine_id: 1},
  {correct_answer: "France", question_id: 11, wine_id: 1},
  {correct_answer: "Gamay", question_id: 12, wine_id: 1}
])

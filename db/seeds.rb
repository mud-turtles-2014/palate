Event.create!([
  {name: "Intro to Blind Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1}
])

EventWine.create!([
  {is_attending: nil, event_id: 1, wine_id: 1, user_id: 1}
])

User.create!([
  {name: "steph", email: "stephtzhang@gmail.com", password: "test", password_confirmation: "test"}
])

Wine.create!([
  {name: "French Gamay", color: "red", description: "Gamay gets a bad rap, but Cru Beaujolais - from one of the 10 designated cru areas in the region - shows why the grape gets called the poor man's Pinot."}
])

Tasting.create!([
  {user: User.first, wine: Wine.first, red_fruits: 0, minerality: 4, oak: 2}
  ])

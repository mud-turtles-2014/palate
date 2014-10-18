# do not add seeds to the top of this file!
# it will interfere with scoring in production

Event.create!([
  # seed data for production scoring
  {name: "Pascaline's Super User Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1},
  # seed data for development
  {name: "Intro to Blind Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1}
])

User.create!([
  # seed data for production scoring
  {name: "pascaline", email: "boss@ladysomm.com", password: "test", password_confirmation: "test"},
  # seed data for development
  {name: "steph", email: "stephtzhang@gmail.com", password: "test", password_confirmation: "test"}
])

EventWine.create!([
  # seed data for production scoring
  # pascaline brings all the wines, beware of future validations
  {is_attending: true, event_id: 1, wine_id: 1, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 2, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 3, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 4, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 5, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 6, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 7, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 8, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 9, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 10, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 11, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 12, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 13, user_id: 1},
  # seed data for development
  {is_attending: true, event_id: 2, wine_id: 1, user_id: 1},
  {is_attending: true, event_id: 2, wine_id: 2, user_id: 2}
])

# seed data for production scoring
Wine.create!([
  {name: "French Gamay", color: "red", description: "Gamay gets a bad rap, but Cru Beaujolais - from one of the 10 designated cru areas in the region - shows why the grape gets called the poor man's Pinot."},
  {name: "US Pinot Noir", color: "red", description: "TKTKTK"},
  {name: "Australian Shiraz", color: "red", description: "TKTKTK"},
  {name: "Argentinian Malbec", color: "red", description: "TKTKTK"},
  {name: "US Cabernet Sauvignon", color: "red", description: "TKTKTK"},
  {name: "US Merlot", color: "red", description: "TKTKTK"},
  {name: "US Zinfandel", color: "red", description: "TKTKTK"},
  {name: "French Cabernet Sauvignon", color: "red", description: "TKTKTK"},
  {name: "Italian Sangiovese", color: "red", description: "TKTKTK"},
  {name: "Italian Nebbiolo", color: "red", description: "TKTKTK"},
  {name: "French Merlot", color: "red", description: "TKTKTK"},
  {name: "French Pinot Noir", color: "red", description: "TKTKTK"},
  {name: "French Syrah", color: "red", description: "TKTKTK"}
])

# old seed data for production scoring
# Tasting.create!([
#   {user: User.first, wine: Wine.find_by(name: "French Gamay"), red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 2, dry: 1, acid: 2, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'gamay' },
#   {user: User.first, wine: Wine.find_by(name: "US Pinot Noir"), red_fruits: 'red', fruit_condition: 4, minerality: 3, oak: 4, dry: 2, acid: 3, tannin: 3, alcohol: 4, climate: 'warm', country: 'us', red_grape: 'pinot_noir' },
#   {user: User.first, wine: Wine.find_by(name: "Australian Shiraz"), red_fruits: 'red', fruit_condition: 5, minerality: 2, oak: 3, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'australia', red_grape: 'syrah_shiraz' },
#   {user: User.first, wine: Wine.find_by(name: "Argentinian Malbec"), red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 4, dry: 2, acid: 3, tannin: 4, alcohol: 5, climate: 'warm', country: 'argentina', red_grape: 'malbec' },
#   {user: User.first, wine: Wine.find_by(name: "US Cabernet Sauvignon"), red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 4, alcohol: 4, climate: 'warm', country: 'us', red_grape: 'cabernet_sauvignon' },
#   {user: User.first, wine: Wine.find_by(name: "US Merlot"), red_fruits: 'red', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'us', red_grape: 'merlot' },
#   {user: User.first, wine: Wine.find_by(name: "US Zinfandel"), red_fruits: 'blue', fruit_condition: 5, minerality: 1, oak: 3, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'us', red_grape: 'zinfandel' },
#   {user: User.first, wine: Wine.find_by(name: "French Cabernet Sauvignon"), red_fruits: 'black', fruit_condition: 3, minerality: 4, oak: 5, dry: 1, acid: 4, tannin: 4, alcohol: 4, climate: 'cool', country: 'france', red_grape: 'cabernet_sauvignon' },
#   {user: User.first, wine: Wine.find_by(name: "Italian Sangiovese"), red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 4, climate: 'cool', country: 'italy', red_grape: 'sangiovese' },
#   {user: User.first, wine: Wine.find_by(name: "Italian Nebbiolo"), red_fruits: 'red', fruit_condition: 1, minerality: 5, oak: 3, dry: 1, acid: 5, tannin: 5, alcohol: 4, climate: 'cool', country: 'italy', red_grape: 'nebbiolo' },
#   {user: User.first, wine: Wine.find_by(name: "French Merlot"), red_fruits: 'red', fruit_condition: 3, minerality: 4, oak: 5, dry: 1, acid: 3, tannin: 3, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'merlot' },
#   {user: User.first, wine: Wine.find_by(name: "French Pinot Noir"), red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 4, dry: 1, acid: 3, tannin: 3, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'pinot_noir' },
#   {user: User.first, wine: Wine.find_by(name: "French Syrah"), red_fruits: 'black', fruit_condition: 3, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'syrah_shiraz' }
#   ])

# seed data for production scoring
# can change to event_wine: EventWine.find_by(wine: Wine.find_by(name: "French Gamay"))
Tasting.create!([
  {user: User.first, event_wine_id: 1, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 2, dry: 1, acid: 2, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'gamay' },
  {user: User.first,  event_wine_id: 2, red_fruits: 'red', fruit_condition: 4, minerality: 3, oak: 4, dry: 2, acid: 3, tannin: 3, alcohol: 4, climate: 'warm', country: 'us', red_grape: 'pinot_noir' },
  {user: User.first,  event_wine_id: 3, red_fruits: 'red', fruit_condition: 5, minerality: 2, oak: 3, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'australia', red_grape: 'syrah_shiraz' },
  {user: User.first,  event_wine_id: 4, red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 4, dry: 2, acid: 3, tannin: 4, alcohol: 5, climate: 'warm', country: 'argentina', red_grape: 'malbec' },
  {user: User.first,  event_wine_id: 5, red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 4, alcohol: 4, climate: 'warm', country: 'us', red_grape: 'cabernet_sauvignon' },
  {user: User.first, event_wine_id: 6, red_fruits: 'red', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'us', red_grape: 'merlot' },
  {user: User.first, event_wine_id: 7, red_fruits: 'blue', fruit_condition: 5, minerality: 1, oak: 3, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'us', red_grape: 'zinfandel' },
  {user: User.first, event_wine_id: 8, red_fruits: 'black', fruit_condition: 3, minerality: 4, oak: 5, dry: 1, acid: 4, tannin: 4, alcohol: 4, climate: 'cool', country: 'france', red_grape: 'cabernet_sauvignon' },
  {user: User.first, event_wine_id: 9, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 4, climate: 'cool', country: 'italy', red_grape: 'sangiovese' },
  {user: User.first, event_wine_id: 10, red_fruits: 'red', fruit_condition: 1, minerality: 5, oak: 3, dry: 1, acid: 5, tannin: 5, alcohol: 4, climate: 'cool', country: 'italy', red_grape: 'nebbiolo' },
  {user: User.first, event_wine_id: 11, red_fruits: 'red', fruit_condition: 3, minerality: 4, oak: 5, dry: 1, acid: 3, tannin: 3, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'merlot' },
  {user: User.first, event_wine_id: 12, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 4, dry: 1, acid: 3, tannin: 3, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'pinot_noir' },
  {user: User.first, event_wine_id: 13, red_fruits: 'black', fruit_condition: 3, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'syrah_shiraz' }
  ])

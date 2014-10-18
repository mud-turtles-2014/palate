Event.create!([
  {name: "Intro to Blind Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1}
])

EventWine.create!([
  {is_attending: nil, event_id: 1, wine_id: 1, user_id: 1}
])

User.create!([
  {name: "pascaline", email: "boss@ladysomm.com", password: "test", password_confirmation: "test"}
])

User.create!([
  {name: "steph", email: "stephtzhang@gmail.com", password: "test", password_confirmation: "test"}
])

Wine.create!([
  {name: "French Gamay", color: "red", description: "Gamay gets a bad rap, but Cru Beaujolais - from one of the 10 designated cru areas in the region - shows why the grape gets called the poor man's Pinot."},
  {name: "US Pinot Noir", color: "red", description: "TKTKTK"},
  {name: "Australian Shiraz", color: "red", description: "TKTKTK"},
  {name: "Argentinian Malbec", color: "red", description: "TKTKTK"},
  {name: "US Cabernet Sauvignon", color: "red", description: "TKTKTK"},
  {name: "US Merlot", color: "red", description: "TKTKTK"},
  # note to steph: tastings inputted up to here
  {name: "US Zinfandel", color: "red", description: "TKTKTK"},
  {name: "French Cabernet Sauvignon", color: "red", description: "TKTKTK"},
  {name: "Italian Sangiovese", color: "red", description: "TKTKTK"},
  {name: "Italian Nebbiolo", color: "red", description: "TKTKTK"},
  {name: "French Merlot", color: "red", description: "TKTKTK"},
  {name: "French Pinot Noir", color: "red", description: "TKTKTK"},
  {name: "French Syrah", color: "red", description: "TKTKTK"}
])

# seed pascaline's 'super user' tastings for grading
Tasting.create!([
  {user: User.first, wine: Wine.find_by(name: "French Gamay"), red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 2, dry: 1, acid: 2, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'gamay' },
  {user: User.first, wine: Wine.find_by(name: "US Pinot Noir"), red_fruits: 'red', fruit_condition: 4, minerality: 3, oak: 4, dry: 2, acid: 3, tannin: 3, alcohol: 4, climate: 'warm', country: 'us', red_grape: 'pinot_noir' },
  {user: User.first, wine: Wine.find_by(name: "Australian Shiraz"), red_fruits: 'red', fruit_condition: 5, minerality: 2, oak: 3, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'australia', red_grape: 'syrah_shiraz' },
  {user: User.first, wine: Wine.find_by(name: "Argentinian Malbec"), red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 4, dry: 2, acid: 3, tannin: 4, alcohol: 5, climate: 'warm', country: 'argentina', red_grape: 'malbec' },
  {user: User.first, wine: Wine.find_by(name: "US Cabernet Sauvignon"), red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 4, alcohol: 4, climate: 'warm', country: 'us', red_grape: 'cabernet_sauvignon' },
  {user: User.first, wine: Wine.find_by(name: "US Merlot"), red_fruits: 'red', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'us', red_grape: 'merlot' },
  ])

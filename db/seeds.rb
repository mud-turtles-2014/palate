# seed data important for production scoring
# DO NOT DELETE
# DO NOT ADD SEED DATA ABOVE
Wine.create!([
  # reds
  {name: "French Gamay", color: "red", description: "Gamay gets a bad rap, but Cru Beaujolais - from one of the 10 designated cru areas in the region - shows why the grape gets called the poor man's Pinot."},
  {name: "US Pinot Noir", color: "red", description: "TKTKTK"},
  {name: "Australian Shiraz", color: "red", description: "TKTKTK"},
  {name: "Argentinian Malbec", color: "red", description: "Originally from western France, Malbec has become synonymous with Argentina, specifically the high-altitude region Mendoza."},
  {name: "US Cabernet Sauvignon", color: "red", description: "TKTKTK"},
  {name: "US Merlot", color: "red", description: "TKTKTK"},
  {name: "US Zinfandel", color: "red", description: "Genetically linked to native Italian and Croatian grapes, Zinfandel has become synonymous with California The uneven ripening grape often produces wines with both tart red and cooked blue fruit characteristics."},
  {name: "French Cabernet Sauvignon", color: "red", description: "TKTKTK"},
  {name: "Italian Sangiovese", color: "red", description: "Sangiovese is often depcited as a powerhouse grape, but traditional Chianti producers like Castello di Volpaia refrain from blending naturally light-bodied, red-fruited Sangiovese with fleshier grapes."},
  {name: "Italian Nebbiolo", color: "red", description: "Nebbiolo is called the king of Italian grapes for reason. The grape reaches its apex in the regions Barolo and Barbaresco, but Langhe Nebbiolo from a good producer like Produttori del Barbaresco will work for a budget-friendly tasting."},
  {name: "French Merlot", color: "red", description: "TKTKTK"},
  {name: "French Pinot Noir", color: "red", description: "TKTKTK"},
  {name: "French Syrah", color: "red", description: "TKTKTK"},
  # whites
  {name: "French Chardonnay", color: "white", description: "Bring a focused Chardonnay from Chablis, the northernmost region in Burgundy. Alternatively, grab an impressive bottling from a lesser region like Chitry, Alice and Olivier de Moor make a good one."},
  {name: "French Sauvignon Blanc", color: "white", description: "Bring a mineral-driven Sauvignon Blanc from Sancerre or Pouilly-Fume in Western France's Loire Valley."},
  {name: "French Chenin Blanc", color: "white", description: "Chenin Blanc is often made in an oxidative style. Additional exposure to oxygen imparts distinct bitter nut and cheese rind characteristics to the wine. Bring a Vouvray Sec from the Loire Valley."},
  {name: "French Viognier", color: "white", description: "TKTKTK"},
  {name: "Italian Pinot Grigio", color: "white", description: "Sometimes Pinot Grigio can be classy. Pick up a bottle from Friuli in the northwestern corner of Italy. Look for producers like Venica & Venica or Livo Felluga."},
  {name: "US Chardonnay", color: "white", description: "TKTKTKT"},
  {name: "German Riesling", color: "white", description: "Germany has a unique classification system to describe a wine's ripeness. Grab a Spatlese bottling, a 'late harvest' wine, that has a more opulent fruit profile and generally some residual sugar."},
  {name: "New Zealand Sauvignon Blanc", color: "white", description: "TKTKTKT"},
  {name: "Australian Riesling", color: "white", description: "Unlike their German counterparts, Australian Rieslings from the Clare and Eden Valleys tend to be vinified dry -- meaning the fruit's sugar is completely fermented. You can still expect the grape's typical stone fruit and cut garden hose notes."}
])
Event.create!([
  {name: "Pascaline's Super User Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1}
])
User.create!([
  {name: "pascaline", email: "boss@ladysomm.com", password: "test", password_confirmation: "test"}
])
EventWine.create!([
  # super user brings all the wines, beware of future validations
  # that may limit 1 wine per attendee
  # red wines
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
  # white wines
  {is_attending: true, event_id: 1, wine_id: 14, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 15, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 16, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 17, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 18, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 19, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 20, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 21, user_id: 1},
  {is_attending: true, event_id: 1, wine_id: 22, user_id: 1}
])
# super user tastings to be used for scoring
Tasting.create!([
  # red wines
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
  {user: User.first, event_wine_id: 13, red_fruits: 'black', fruit_condition: 3, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'syrah_shiraz' },
  # white wines
  {user: User.first, event_wine_id: 14, white_fruits: 'apple_pear', fruit_condition: 1, minerality: 5, oak: 1, dry: 1, acid: 5, alcohol: 3, climate: 'cool', country: 'france', white_grape: 'chardonnay' },
  {user: User.first, event_wine_id: 15, white_fruits: 'apple_pear', fruit_condition: 1, minerality: 5, oak: 1, dry: 1, acid: 4, alcohol: 3, climate: 'cool', country: 'france', white_grape: 'sauvignon_blanc' },
  {user: User.first, event_wine_id: 16, white_fruits: 'apple_pear', fruit_condition: 4, minerality: 4, oak: 1, dry: 2, acid: 5, alcohol: 3, climate: 'cool', country: 'france', white_grape: 'chenin_blanc' },
  {user: User.first, event_wine_id: 17, white_fruits: 'stone', fruit_condition: 3, minerality: 3, oak: 2, dry: 2, acid: 3, alcohol: 4, climate: 'warm', country: 'france', white_grape: 'viognier' },
  # change below back to
  # white_grape: 'pinot_grigio'
  {user: User.first, event_wine_id: 18, white_fruits: 'apple_pear', fruit_condition: 3, minerality: 3, oak: 1, dry: 1, acid: 4, alcohol: 3, climate: 'cool', country: 'italy', white_grape: 'pinot_grigio' },
  {user: User.first, event_wine_id: 19, white_fruits: 'apple_pear', fruit_condition: 3, minerality: 2, oak: 4, dry: 2, acid: 3, alcohol: 4, climate: 'warm', country: 'us', white_grape: 'chardonnay' },
  {user: User.first, event_wine_id: 20, white_fruits: 'stone', fruit_condition: 3, minerality: 5, oak: 1, dry: 3, acid: 5, alcohol: 2, climate: 'cool', country: 'germany', white_grape: 'riesling' },
  {user: User.first, event_wine_id: 21, white_fruits: 'tropical', fruit_condition: 3, minerality: 2, oak: 1, dry: 1, acid: 4, alcohol: 4, climate: 'warm', country: 'new_zealand', white_grape: 'sauvignon_blanc' },
  {user: User.first, event_wine_id: 22, white_fruits: 'stone', fruit_condition: 3, minerality: 3, oak: 1, dry: 1, acid: 4, alcohol: 4, climate: 'warm', country: 'australia', white_grape: 'riesling' }
  ])

# seed data for testing and development
# ok to delete
Event.create!([
  {name: "Intro to Blind Tasting", location: "48 Wall St, NY, NY", date: "2014-10-20 16:45:00", time: "2014-10-20 16:45:00", user_id: 2}
])

User.create!([
  {name: "steph", email: "stephtzhang@gmail.com", password: "test", password_confirmation: "test"},
  {name: "katherine", email: "kat@gmail.com", password: "test", password_confirmation: "test"},
  {name: "jess", email: "jess@gmail.com", password: "test", password_confirmation: "test"}
])

EventWine.create!([
  {is_attending: true, event_id: 2, wine_id: 1, user_id: 2}, # 23
  {is_attending: true, event_id: 2, wine_id: 22, user_id: 3}, # 24
  {is_attending: true, event_id: 2, wine_id: 21, user_id: 4} # 25
])

Tasting.create!([
  # steph's tastings
  {user: User.second, event_wine_id: 23, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'gamay' },
  {user: User.second,  event_wine_id: 24, white_fruits: 'apple_pear', fruit_condition: 3, minerality: 3, oak: 1, dry: 2, acid: 3, alcohol: 4, climate: 'warm', country: 'us', white_grape: 'chenin_blanc' },
  # katherine's tastings
  {user: User.third, event_wine_id: 23, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 2, dry: 1, acid: 2, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'pinot_noir' },
  {user: User.third,  event_wine_id: 24, white_fruits: 'stone', fruit_condition: 4, minerality: 3, oak: 1, dry: 2, acid: 3, alcohol: 4, climate: 'warm', country: 'new_zealand', white_grape: 'sauvignon_blanc' }
])

# demo event
Event.create!([
  {name: "Woo App Testing", location: "48 Wall St, NY, NY", date: "2014-10-20 16:45:00", time: "2014-10-20 16:45:00", user_id: 2}
])

EventWine.create!([
  {is_attending: true, event_id: 3, wine_id: 14, user_id: 2}, # 14 wine_id for chablis
  {is_attending: true, event_id: 3, wine_id: 21, user_id: 3} # 21 wine_id for nz sauv blanc

])

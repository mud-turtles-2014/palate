# seed data important for production scoring
# DO NOT DELETE
# DO NOT ADD SEED DATA ABOVE
Wine.create!([
  # reds
  {name: "French Gamay", country: "France", grape: "Gamay", color: "red", description: "Gamay gets a bad rap, but Cru Beaujolais - from one of the 10 designated cru areas in the region - shows why the grape gets called the poor man's Pinot."},
  {name: "US Pinot Noir", country: "United States", grape: "Pinot Noir", color: "red", description: "Expect a denser Pinot Noir from California than you would find in Burgundy. The climate is warmer, producing riper fruit, and wines labelled Pinot Noir often have a percentage of Syrah or other more full-bodied grape blended in."},
  {name: "Australian Shiraz", country: "Australia", grape: "Syrah/Shiraz",color: "red", description: "Some think that the name Shiraz indicates that the grape originated in the Middle East. No one is quite sure how Shiraz came to be Australia's name for the noble French grape."},
  {name: "Argentinian Malbec", country: "Argentina", grape: "Malbec", color: "red", description: "Originally from western France, Malbec has become synonymous with Argentina, specifically the high-altitude region Mendoza."},
  {name: "US Cabernet Sauvignon", country: "United States", grape: "Cabernet Sauvignon", color: "red", description: "What US Cabernet Sauvignon lacks in minerality, it makes up for with fruit. Well-made California Cabernet Sauvignon shows impressive amounts of fruit in its old age."},
  {name: "US Merlot", country: "United States", grape: "Merlot", color: "red", description: "Merlot comes from the same family as Cabernet Sauvignon and the Bordeaux varietals. It will show just the slightest greeness, as is typical of grapes from this family."},
  {name: "US Zinfandel", color: "red", description: "Genetically linked to native Italian and Croatian grapes, Zinfandel has become synonymous with California. The uneven ripening of the grape often produces wines with both tart red and cooked blue fruit characteristics."},
  {name: "French Cabernet Sauvignon", country: "France", grape: "Cabernet Sauvignon",color: "red", description: "Cabernet Sauvignon dominates blends in the Left Bank of Bordeaux, the region famous for the Haut-Medoc and its first growths."},
  {name: "Italian Sangiovese", country: "Italy", grape: "Sangiovese",color: "red", description: "Sangiovese is often depicted as a powerhouse grape, but traditional Chianti producers like Castello di Volpaia refrain from blending naturally light-bodied, red-fruited Sangiovese with fleshier grapes."},
  {name: "Italian Nebbiolo", country: "Italy", grape: "Nebbiolo", color: "red", description: "Nebbiolo is called the king of Italian grapes for reason. The grape reaches its apex in the regions Barolo and Barbaresco, but Langhe Nebbiolo from a good producer like Produttori del Barbaresco will work for a budget-friendly tasting."},
  {name: "French Merlot", country: "France", grape: "Merlot", color: "red", description: "TKTKTK"},
  {name: "French Pinot Noir", country: "France", grape: "Pinot Noir", color: "red", description: "TKTKTK"},
  {name: "French Syrah", country: "France", grape: "Syrah/Shiraz", color: "red", description: "TKTKTK"},
  # whites
  {name: "French Chardonnay", color: "white", country: "France", grape: "Chardonnay", description: "Bring a focused Chardonnay from Chablis, the northernmost region in Burgundy. Alternatively, grab an impressive bottling from a lesser region like Chitry. Alice and Olivier de Moor make a good one."},
  {name: "French Sauvignon Blanc", country: "France", grape: "Sauvignon Blanc", color: "white", description: "Bring a mineral-driven Sauvignon Blanc from Sancerre or Pouilly-Fume in Western France's Loire Valley."},
  {name: "French Chenin Blanc", color: "white", country: "France", grape: "Chenin Blanc", description: "Chenin Blanc is often made in an oxidative style. Additional exposure to oxygen imparts distinct bitter nut and cheese rind characteristics to the wine. Bring a Vouvray Sec from the Loire Valley."},
  {name: "French Viognier", country: "French", grape: "Viognier", color: "white", description: "Viognier is known for its waxy texture and rich melon profile. Condrieu in the Northern Rhone is king when it comes to the grape, but good bottlings from the Collines Rhodaniennes demonstrate Viognier well too."},
  {name: "Italian Pinot Grigio", country: "Italy", grape: "Pinot Grigio", color: "white", description: "Sometimes Pinot Grigio can be classy. Pick up a bottle from Friuli in the northwestern corner of Italy. Look for producers like Venica & Venica or Livio Felluga."},
  {name: "US Chardonnay", country: "United States", grape: "Chardonnay", color: "white", description: "Oaked California Chardonnay plays a good foil to its lean, mineral-driven relatives in France."},
  {name: "German Riesling", country: "Germany", grape: "Riesling", color: "white", description: "Germany has a unique classification system to describe a wine's ripeness. Grab a Spatlese bottling, a 'late harvest' wine, that has a more opulent fruit profile and generally some residual sugar."},
  {name: "New Zealand Sauvignon Blanc", country: "New Zealand", grape: "Sauvignon Blanc", color: "white", description: "New Zealand launched screw caps into prominence with their reasonably priced Sauvignon Blanc from Marlborough on the South Island."},
  {name: "Australian Riesling", country: "Australia", grape: "Riesling", color: "white", description: "Unlike their German counterparts, Australian Rieslings from the Clare and Eden Valleys tend to be vinified dry -- meaning the fruit's sugar is completely fermented. You can still expect the grape's typical stone fruit and cut garden hose notes."}
])
Event.create!([
  {name: "Pascaline's Super User Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1}
])
User.create!([
  {name: "pascaline", email: "boss@ladysomm.com", password: "test", password_confirmation: "test"}
])

# THESE WINE IDS ARE
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
  {user: User.first, event_wine_id: 1, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 2, dry: 1, acid: 2, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'gamay', tasting_notes: "pomegranate, underripe wild strawberry" },
  {user: User.first,  event_wine_id: 2, red_fruits: 'red', fruit_condition: 4, minerality: 3, oak: 4, dry: 2, acid: 3, tannin: 3, alcohol: 4, climate: 'warm', country: 'united_states', red_grape: 'pinot_noir', tasting_notes: "bruised cherry, smoke" },
  {user: User.first,  event_wine_id: 3, red_fruits: 'red', fruit_condition: 5, minerality: 2, oak: 3, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'australia', red_grape: 'syrah_shiraz', tasting_notes: "slightly herbal, confected fruit" },
  {user: User.first,  event_wine_id: 4, red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 4, dry: 2, acid: 3, tannin: 4, alcohol: 5, climate: 'warm', country: 'argentina', red_grape: 'malbec', tasting_notes: "fig, raisin" },
  {user: User.first,  event_wine_id: 5, red_fruits: 'black', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 4, alcohol: 4, climate: 'warm', country: 'united_states', red_grape: 'cabernet_sauvignon', tasting_notes: "vanilla, baking spices, bell pepper" },
  {user: User.first, event_wine_id: 6, red_fruits: 'red', fruit_condition: 4, minerality: 2, oak: 5, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'united_states', red_grape: 'merlot', tasting_notes: "stewed red plums, baking spices, slight sage" },
  {user: User.first, event_wine_id: 7, red_fruits: 'blue', fruit_condition: 5, minerality: 1, oak: 3, dry: 2, acid: 3, tannin: 3, alcohol: 5, climate: 'warm', country: 'united_states', red_grape: 'zinfandel', tasting_notes: "cherry pie, unripe blueberries" },
  {user: User.first, event_wine_id: 8, red_fruits: 'black', fruit_condition: 3, minerality: 4, oak: 5, dry: 1, acid: 4, tannin: 4, alcohol: 4, climate: 'cool', country: 'france', red_grape: 'cabernet_sauvignon', tasting_notes: "bell pepper, cigar box, leather" },
  {user: User.first, event_wine_id: 9, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 4, climate: 'cool', country: 'italy', red_grape: 'sangiovese', tasting_notes: "tart cherries, tomato leaf, earthenware" },
  {user: User.first, event_wine_id: 10, red_fruits: 'red', fruit_condition: 1, minerality: 5, oak: 3, dry: 1, acid: 5, tannin: 5, alcohol: 4, climate: 'cool', country: 'italy', red_grape: 'nebbiolo', tasting_notes: "cranberry, dried purple flowers, truffle" },
  {user: User.first, event_wine_id: 11, red_fruits: 'red', fruit_condition: 3, minerality: 4, oak: 5, dry: 1, acid: 3, tannin: 3, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'merlot', tasting_notes: "raspberry, mint, vanilla" },
  {user: User.first, event_wine_id: 12, red_fruits: 'red', fruit_condition: 2, minerality: 4, oak: 4, dry: 1, acid: 3, tannin: 3, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'pinot_noir', tasting_notes: "raspberry, mint, vanilla" },
  {user: User.first, event_wine_id: 13, red_fruits: 'black', fruit_condition: 3, minerality: 4, oak: 4, dry: 1, acid: 4, tannin: 4, alcohol: 3, climate: 'cool', country: 'france', red_grape: 'syrah_shiraz', tasting_notes: "cured meat, herbes de provence, black cherry" },
  # white wines
  {user: User.first, event_wine_id: 14, white_fruits: 'apple_pear', fruit_condition: 1, minerality: 5, oak: 1, dry: 1, acid: 5, alcohol: 3, climate: 'cool', country: 'france', white_grape: 'chardonnay', tasting_notes: "unripe quince, unripe bosc pear, limestone, saline" },
  {user: User.first, event_wine_id: 15, white_fruits: 'apple_pear', fruit_condition: 1, minerality: 5, oak: 1, dry: 1, acid: 4, alcohol: 3, climate: 'cool', country: 'france', white_grape: 'sauvignon_blanc', tasting_notes: "granny smith apples, lime zest" },
  {user: User.first, event_wine_id: 16, white_fruits: 'apple_pear', fruit_condition: 4, minerality: 4, oak: 1, dry: 2, acid: 5, alcohol: 3, climate: 'cool', country: 'france', white_grape: 'chenin_blanc', tasting_notes: "parmesan rind, toasted walnut skin, bruised yellow apple" },
  {user: User.first, event_wine_id: 17, white_fruits: 'stone', fruit_condition: 3, minerality: 3, oak: 2, dry: 2, acid: 3, alcohol: 4, climate: 'warm', country: 'france', white_grape: 'viognier', tasting_notes: "slightly overripe papaya, stewed peaches, honeysuckle" },
  {user: User.first, event_wine_id: 18, white_fruits: 'apple_pear', fruit_condition: 3, minerality: 3, oak: 1, dry: 1, acid: 4, alcohol: 3, climate: 'cool', country: 'italy', white_grape: 'pinot_grigio', tasting_notes: "spent beer yeast, red apple, slight bitterness" },
  {user: User.first, event_wine_id: 19, white_fruits: 'apple_pear', fruit_condition: 3, minerality: 2, oak: 4, dry: 2, acid: 3, alcohol: 4, climate: 'warm', country: 'united_states', white_grape: 'chardonnay', tasting_notes: "butter, vanilla, baked apple" },
  {user: User.first, event_wine_id: 20, white_fruits: 'stone', fruit_condition: 3, minerality: 5, oak: 1, dry: 3, acid: 5, alcohol: 2, climate: 'cool', country: 'germany', white_grape: 'riesling', tasting_notes: "slate, racy acidity, apricot, small white flowers" },
  {user: User.first, event_wine_id: 21, white_fruits: 'tropical', fruit_condition: 3, minerality: 2, oak: 1, dry: 1, acid: 4, alcohol: 4, climate: 'warm', country: 'new_zealand', white_grape: 'sauvignon_blanc', tasting_notes: "pineapple, green melon" },
  {user: User.first, event_wine_id: 22, white_fruits: 'stone', fruit_condition: 3, minerality: 3, oak: 1, dry: 1, acid: 4, alcohol: 4, climate: 'warm', country: 'australia', white_grape: 'riesling', tasting_notes: "spalding basketball, white peach" }
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
  {user: User.second,  event_wine_id: 24, white_fruits: 'apple_pear', fruit_condition: 3, minerality: 3, oak: 1, dry: 2, acid: 3, alcohol: 4, climate: 'warm', country: 'united_states', white_grape: 'chenin_blanc' },
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

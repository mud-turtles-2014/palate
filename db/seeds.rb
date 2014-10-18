Event.create!([
  {name: "Intro to Blind Tasting", location: "48 Wall St, NY, NY", date: "2014-10-17 16:45:19", time: "2014-10-17 16:45:19", user_id: 1}
])
EventWine.create!([
  {is_attending: nil, event_id: 1, wine_id: 1, user_id: 1}
])
Property.create!([
  {property: "fruits"},
  {property: "mineral"},
  {property: "mineral_level"},
  {property: "oak"},
  {property: "dry"},
  {property: "acid"},
  {property: "tannin", red_only: true},
  {property: "alcohol"},
  {property: "cool_climate"},
  {property: "old_world"},
  {property: "country"},
  {property: "grape"},
])
User.create!([
  {name: "steph", email: "stephtzhang@gmail.com", password: "test", password_confirmation: "test"}
])
Wine.create!([
  {name: "French Gamay", color: "red", description: "Gamay gets a bad rap, but Cru Beaujolais - from one of the 10 designated cru areas in the region - shows why the grape gets called the poor man's Pinot."}
])
WineProperty.create!([
  {property_value: "red", property_id: 1, wine_id: 1},
  {property_value: "stone", property_id: 2, wine_id: 1},
  {property_value: "4", property_id: 3, wine_id: 1},
  {property_value: "false", property_id: 4, wine_id: 1},
  {property_value: "true", property_id: 5, wine_id: 1},
  {property_value: "2", property_id: 6, wine_id: 1},
  {property_value: "4", property_id: 7, wine_id: 1},
  {property_value: "4", property_id: 8, wine_id: 1},
  {property_value: "true", property_id: 9, wine_id: 1},
  {property_value: "true", property_id: 10, wine_id: 1},
  {property_value: "France", property_id: 11, wine_id: 1},
  {property_value: "Gamay", property_id: 12, wine_id: 1}
])

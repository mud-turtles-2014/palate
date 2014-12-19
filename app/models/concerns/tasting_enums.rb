module TastingEnums
  extend ActiveSupport::Concern

	RED_FRUIT_ENUMS =       { red: 1, 
                            blue: 2, 
                            black: 3}
  WHITE_FRUIT_ENUMS =     { citrus: 1, 
                            apple_pear: 2, 
                          	stone: 3, 
                          		tropical: 4}
  FRUIT_CONDITION_ENUMS = { tart: 1, 
                          	under_ripe: 2, 
                          	ripe: 3, 
                          	over_ripe: 4, 
                          	jammy: 5 }
  CLIMATE_ENUMS =         { cool: 1, 
                          	warm: 2}
  COUNTRY_ENUMS =         { france: 1, 
                          	italy: 2, 
                          	united_states: 3, 
                          	australia: 4, 
                          	argentina: 5, 
                          	germany: 6, 
                          	new_zealand: 7 }
  RED_GRAPE_ENUMS =       { gamay: 1, 
                          	cabernet_sauvignon: 2, 
                          	merlot: 3, 
                          	malbec: 4, 
                          	syrah_shiraz: 5, 
                          	pinot_noir: 6, 
                          	sangiovese: 7, 
                          	nebbiolo: 8, 
                          	zinfandel: 9 }
  WHITE_GRAPE_ENUMS =     { chardonnay: 1, 
                          	sauvignon_blanc: 2, 
                          	riesling: 3, 
                          	chenin_blanc: 4, 
                          	viognier: 5, 
                          	pinot_grigio: 6 } 
end
module Feedback
  extend ActiveSupport::Concern

  FRUITS_FEEDBACK = "Each grape varietal has its own characteristic fruit profile. It's"\
                    "also easy to choose the fruit category that most defines a wine."\
                    "Only more tasting experience can solidify that link."
  MINERALITY_FEEDBACK = "Minerality can fall into inorganic (stone, crushed rock or organic"\
                        "(earth, clay) categories."
  OAK_FEEDBACK = "Oak imparts characteristic vanilla and baking spice notes to wine. It"\
                 "also makes wines slightly more textural."
  DRY_FEEDBACK = "Dryness simply refers to the lack of sugar in a wine. Is there any"\
                 "lingering sweetness on your tongue? If so, chances are the wine"\
                 "isn't dry."
  ACID_FEEDBACK = "How much saliva is pooling in your mouth after you sip? The more saliva"\
                  "pooling means a higher acid wine. Sounds strange, but it works."
  TANNIN_FEEDBACK = "Tannins are compounds found in grape skins that cause the sensation"\
                    "of friction in your mouth. If you feel a lot of grip on your tongue,"\
                    "those are tannins."
  ALCOHOL_FEEDBACK = "Alcohol can be hard to detect accurately. Exhale after you taste."\
                     "The hotter your throat feels, the higher the alcohol probably is."
  FRUIT_CONDITION_FEEDBACK = "This is somewhat linked to acid and alcohol. Does the wine"\
                             "tast tart (highly acidic) or is the wine ripe and jammy (highly"\
                             "alcoholic). Sugar gets converted to alcohol, so riper grapes"\
                             "produce more alcoholic wine."
end
class Tasting < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_wine
  has_one :wine, through: :event_wine
  has_one :event, through: :event_wine

  enum red_fruits: { red: 1, blue: 2, black: 3}
  enum white_fruits: { apple_pear: 1, stone: 2, citrus: 3, tropical: 4}
  enum fruit_condition: { tart: 1, ripe: 2, over_ripe: 3, jammy: 4 }
  enum climate: { cool: 1, warm: 2}
  enum country: { france: 1, italy: 2, us: 3, australia: 4, argentina: 5, germany: 6, new_zealand: 7 }
  enum red_grape: { gamay: 1, cabernet_sauvignon: 2, merlot: 3, malbec: 4, syrah_shiraz: 5, pinot_noir: 6, sangiovese: 7, nebbiolo: 8, zinfandel: 9 }
  enum white_grape: { chardonnay: 1, sauvignon_blanc: 2, riesling: 3, chenin_blanc: 4, viognier: 5 }

  # def find_wine
  #   self.event_wine.wine
  # end
end

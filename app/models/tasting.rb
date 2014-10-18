class Tasting < ActiveRecord::Base
  belongs_to :user
  belongs_to :wine

  enum red_fruits: { red: 0, blue: 1, black: 2}
  enum white_fruits: { apple_pear: 0, stone: 1, citrus: 2, tropical: 3}
  enum climate: { cool: 0, warm:1}
  enum country: { france: 0, italy: 1, us: 2, australia: 3, argentina: 4, germany: 5, new_zealand: 6}
  enum red_grape: { gamay: 0, cabernet_sauvignon: 1, merlot: 2, malbec: 3, syrah_shiraz: 4 }
  enum white_grape: { chardonnay: 0, sauvignon_blanc: 1, reisling: 2, chenin_blanc: 3, viognier: 4 }
end

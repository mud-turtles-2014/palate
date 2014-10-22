require 'rails_helper'

describe Tasting do
  let(:tasting) {Tasting.new( red_fruits: 1, white_fruits: nil, minerality: 4, oak: 2, dry: 1, acid: 2, tannin: 4, alcohol: 3, climate: 1, country: 1, red_grape: 1, white_grape: nil, fruit_condition: 2)}

  it "returns 'red' for the value of the tasting's red fruits property" do
    expect(tasting.red_fruits).to eq "red"
  end

  it "returns 'france' for the value of the tasting's country property" do
    expect(tasting.country).to eq "france"
  end

  it "returns 2 for the value of the tasting's acid property" do
    expect(tasting.acid).to eq 2
  end

  describe "#convert_num_to_category" do
    # let(:category) {tasting.acid}

    it "returns 'Med-Minus' for the category" do
      expect(tasting.convert_num_to_category(tasting.acid)).to eq "Med-Minus"
    end
  end
end

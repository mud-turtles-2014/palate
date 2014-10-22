require 'rails_helper'

describe Event do
  let(:event1) {Event.new(name: "Woo App Testing", location: "48 Wall St, NY, NY", date: "2014-10-20 20:45:00", time: "2014-10-20 20:45:00", user_id: 2)}
  let(:event2) {Event.new(name: nil, location: "48 Wall St, NY, NY", date: "2014-10-20 20:45:00", time: "2014-10-20 20:45:00", user_id: 2)}
  let(:event3) {Event.new(name: "Woo App Testing", location: "48 Wall St, NY, NY", date: nil, time: "2014-10-20 20:45:00", user_id: 2)}

  it "is valid with a name, location, date, and time" do
    expect(event1).to be_valid
  end

  it "is invalid without a name" do
    event2.valid?
    expect(event2.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a date" do
    event3.valid?
    expect(event3.errors[:date]).to include("can't be blank")
  end
end

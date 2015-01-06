require 'rails_helper'

feature 'Create Event' do

  scenario "saves valid new event to the database" do
    sign_up
    visit new_event_path
    expect{
      fill_in "Event Name", :with => "Great Tasting"
      fill_in "Event Location", :with => "48 Wall St, NY, NY"
      fill_in "date", :with => "2014-10-30 20:45:00"
      fill_in "time", :with => "2014-10-30 20:45:00"
      fill_in "Invite guests by entering emails separated by commas!", :with => "test@example.com"
      click_button 'Save'
    }.to change(Event, :count).by(1)
  end

  it "redirects to event page" do
  end

  def sign_up
    visit root_path
    click_link "Login/Signup"
      fill_in "Name", with: "Name"
      find('form#new_user').fill_in "Email", with: "test@example.com"
      find('form#new_user').fill_in "Password", with: "test123"
      find('form#new_user').fill_in "Confirm Password", with: "test123"
      click_button 'Sign Up'
  end
end

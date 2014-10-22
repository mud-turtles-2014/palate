require 'rails_helper'

feature 'User sign up' do

  scenario "adds a new user" do
    visit root_path
    expect{
      click_link "Login/Signup"
      fill_in "Name", with: "Name"
      find('form#new_user').fill_in "Email", with: "test@example.com"
      find('form#new_user').fill_in "Password", with: "test123"
      find('form#new_user').fill_in "Confirm Password", with: "test123"
      click_button 'Sign Up'
    }.to change(User, :count).by(1)
  end
end

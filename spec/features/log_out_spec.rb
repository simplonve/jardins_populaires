require 'rails_helper'

describe 'Log out' do
  scenario 'Log out' do
    user = create(:user)

    visit root_path
    click_link 'Log in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")

    click_link('Log out')

    expect(page).to have_content('Logged out successfully.')
  end
end
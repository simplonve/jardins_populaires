require 'rails_helper'

feature 'Sign in' do
  scenario 'Sign in' do
    user = create(:user)

    visit root_path
    click_link 'Log in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Log in'

    expect(page).to have_content("Bonjour !")
  end
end
require 'rails_helper'

feature 'user signs in' do
  let(:user) { Fabricate :user }

  scenario 'with valid email and password' do
    sign_in user

    expect(page).to have_content('Profile')
  end

  scenario 'with invalid email and password' do
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log in'

    expect(page).to have_content("Something was wrong with your email or password.")
  end
end

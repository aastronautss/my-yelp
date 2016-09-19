require 'rails_helper'

feature 'user signs in and signs out' do
  let(:user) { Fabricate :user }

  scenario 'with valid email and password' do
    sign_in user
    expect(page).to have_content('Profile')

    sign_out
    expect(page).to have_content('You have successfully logged out.')
  end
end

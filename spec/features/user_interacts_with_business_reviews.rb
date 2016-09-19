require 'rails_helper'

feature 'user interacts with business reviews' do
  let!(:user) { Fabricate :user }
  let!(:business) { Fabricate :business }

  scenario 'user adds a review to a business' do
    sign_in user

    visit_business_page business
    expect(page).to have_content(business.name.titleize)
    expect(page).to have_content(business.address)

    add_review(1, 'asdf')
    expect(page).to have_content('asdf')
  end
end

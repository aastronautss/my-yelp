# ====------------------------====
# Controller and Model Specs
# ====------------------------====

def set_user
  user = Fabricate :user
  session[:user_id] = user.id
end

def clear_current_user
  session[:user_id] = nil
end

def current_user
  @current_user ||= begin
    User.find session[:user_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end
end

# ====------------------------====
# Feature Specs
# ====------------------------====

def sign_in(a_user = nil)
  user = a_user || Fabricate(:user)

  visit login_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

def sign_out
  visit root_path
  click_link 'Logout'
end

def visit_business_page(business = Fabricate(:business))
  visit root_path
  click_link business.name.titleize
end

def add_review(rating = 1, body = 'asdf')
  select rating.to_s, from: 'Rating'
  fill_in 'review_body', with: body
  click_button 'Submit'
end

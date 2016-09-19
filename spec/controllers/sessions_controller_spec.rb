require 'rails_helper'

describe SessionsController do
  describe 'GET new' do
    it_behaves_like 'a logged out action' do
      let(:action) { get :new }
    end
  end

  describe 'POST create' do
    it_behaves_like 'a logged out action' do
      let(:action) { post :create, email: 'test@test.co', password: 'hi' }
    end

    context 'with valid credentials' do
      let(:user) { Fabricate :user }
      before { post :create, email: user.email, password: user.password }

      it 'adds the correct user to the session' do
        expect(current_user).to eq(user)
      end

      it 'redirects to the home path' do
        expect(response).to redirect_to(home_path)
      end
    end

    context 'with invalid credentials' do
      let(:user) { Fabricate :user }
      before { post :create, email: user.email, password: 'wrongpassword' }

      it 'does not add the user to the session' do
        expect(current_user).to be_nil
      end

      it 'sets the flash' do
        expect(flash[:danger]).to be_present
      end

      it 'redirects to the login path' do
        expect(response).to redirect_to(login_path)
      end
    end

    context 'with no user record found' do
      let(:user) { Fabricate :user }
      before { post :create, email: '', password: 'doesntmatter' }

      it 'does not add a user to the session' do
        expect(current_user).to be_nil
      end

      it 'sets the flash' do
        expect(flash[:danger]).to be_present
      end

      it 'redirects to the login path' do
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'DELETE destroy' do
    let(:action) { delete :destroy }
    before { set_user }

    it_behaves_like 'a logged in action'

    it 'clears the session' do
      action
      expect(current_user).to be_nil
    end

    it 'sets the flash' do
      action
      expect(flash[:success]).to be_present
    end

    it 'redirects to the root path' do
      action
      expect(response).to redirect_to(root_path)
    end
  end
end

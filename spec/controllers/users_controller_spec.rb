require 'rails_helper'

describe UsersController do
  describe 'GET new' do
    let(:action) { get :new }

    it_behaves_like 'a logged out action'

    it 'sets @user' do
      action
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe 'POST create' do
    it_behaves_like 'a logged out action' do
      let(:action) { post :create, user: Fabricate.attributes_for(:user) }
    end

    context 'with valid input' do
      let(:action) { post :create, user: Fabricate.attributes_for(:user) }

      it 'creates a user record' do
        expect{ action }.to change(User, :count).by(1)
      end

      it 'redirects to the sign in page' do
        action
        expect(response).to redirect_to(login_path)
      end
    end

    context 'with invalid input' do
      let(:action) { post :create, user: { password: 'hello' } }

      it 'does not create a user record' do
        expect{ action }.to change(User, :count).by(0)
      end

      it 'renders :new template' do
        action
        expect(response).to render_template(:new)
      end

      it 'adds errors to @user' do
        action
        expect(assigns(:user).errors).to_not be_empty
      end
    end
  end
end

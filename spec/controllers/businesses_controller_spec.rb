require 'rails_helper'

describe BusinessesController do
  describe 'GET index' do
    before do
      @businesses = Fabricate.times 4, :business
      get :index
    end

    it 'sets @businesses' do
      expect(assigns(:businesses)).to match_array(@businesses)
    end

    it 'renders :index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    before do
      @business = Fabricate :business
      get :show, id: @business.id
    end

    it 'sets @business' do
      expect(assigns(:business)).to eq(@business)
    end

    it 'sets @review' do
      expect(assigns(:review)).to be_new_record
      expect(assigns(:review)).to be_instance_of(Review)
    end

    it 'renders :show' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new' do
    before do
      set_user
      get :new
    end

    it_behaves_like 'a logged in action' do
      let(:action) { get :new }
    end

    it 'sets @business' do
      expect(assigns(:business)).to be_new_record
      expect(assigns(:business)).to be_instance_of(Business)
    end

    it 'renders :new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    before { set_user }

    it_behaves_like 'a logged in action' do
      let(:action) { post :create, business: Fabricate.attributes_for(:business) }
    end

    context 'with valid input' do
      let(:action) { post :create, business: Fabricate.attributes_for(:business) }

      it 'creates a Business record' do
        expect{ action }.to change(Business, :count).by(1)
      end

      it 'sets the flash' do
        action
        expect(flash[:success]).to be_present
      end

      it 'redirects to the business page' do
        action
        expect(response).to redirect_to(business_path(Business.last))
      end
    end

    context 'with invalid input' do
      let(:action) do
        post :create,
          business: Fabricate.attributes_for(:business, name: '')
      end

      it 'does not create a Business record' do
        expect{ action }.to change(Business, :count).by(0)
      end

      it 'renders :new' do
        action
        expect(response).to render_template(:new)
      end
    end
  end
end

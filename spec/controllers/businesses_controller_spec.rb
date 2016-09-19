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
end

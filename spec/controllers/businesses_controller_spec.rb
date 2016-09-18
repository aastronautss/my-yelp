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
end

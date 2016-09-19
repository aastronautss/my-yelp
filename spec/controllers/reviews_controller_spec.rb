require 'rails_helper'

describe ReviewsController do
  describe 'POST create' do
    it_behaves_like 'a logged in action' do
      let(:action) do
        post :create,
        business_id: Fabricate(:business).id,
        review: Fabricate.attributes_for(:review)
      end
    end

    context 'with valid input' do
      before { set_user }
      let(:business) { Fabricate :business }
      let(:action) do
        post :create,
          business_id: business.id,
          review: Fabricate.attributes_for(:review, user: nil, business: nil)
      end

      it 'sets @business' do
        action
        expect(assigns(:business)).to be_present
      end

      it 'sets @review' do
        action
        expect(assigns(:review)).to be_present
      end

      it 'creates a review record' do
        expect{ action }.to change(Review, :count).by(1)
      end

      it 'sets the flash' do
        action
        expect(flash[:success]).to be_present
      end

      it 'redirects to the corresponding business page' do
        action
        expect(response).to redirect_to(business_path(business))
      end
    end

    context 'with invalid input' do
      before { set_user }
      let(:business) { Fabricate :business }
      let(:action) do
        post :create,
          business_id: business.id,
          review: Fabricate.attributes_for(:review, body: nil, user: nil, business: nil)
      end

      it 'sets @business' do
        action
        expect(assigns(:business)).to be_present
      end

      it 'sets @review' do
        action
        expect(assigns(:review)).to be_present
      end

      it 'does not create a review record' do
        expect{ action }.to change(Review, :count).by(0)
      end

      it 'renders the business template' do
        action
        expect(response).to render_template('businesses/show')
      end
    end

    context 'with an existing review from the user' do
      let(:business) { Fabricate :business }
      let(:action) do
        post :create,
          business_id: business.id,
          review: Fabricate.attributes_for(:review, user: nil, business: nil)
      end

      before do
        set_user
        Fabricate :review, user: current_user, business: business
      end

      it 'sets @business' do
        action
        expect(assigns(:business)).to be_present
      end

      it 'sets @review' do
        action
        expect(assigns(:review)).to be_present
      end

      it 'does not create a review record' do
        expect{ action }.to change(Review, :count).by(0)
      end

      it 'renders the business template' do
        action
        expect(response).to render_template('businesses/show')
      end
    end
  end
end

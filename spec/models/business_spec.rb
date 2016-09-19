require 'rails_helper'

describe Business do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
  end

  context 'associations' do
    it { should have_many(:reviews).dependent(:destroy) }
  end

  describe '#rating' do
    context 'with no existing reviews' do
      it 'returns nil' do
        business = Fabricate :business

        expect(business.rating).to be_nil
      end
    end

    # Three tests cases for triangulation
    context 'with existing reviews' do
      let(:business) { Fabricate :business }

      it 'returns an average of one review' do
        Fabricate :review, business: business, rating: 4, user: Fabricate(:user)

        expect(business.rating).to eq(4)
      end

      it 'returns an average of two reviews' do
        Fabricate :review, business: business, rating: 4, user: Fabricate(:user)
        Fabricate :review, business: business, rating: 5, user: Fabricate(:user)

        expect(business.rating).to eq(4.5)
      end

      it 'returns an average of three reviews' do
        Fabricate :review, business: business, rating: 3, user: Fabricate(:user)
        Fabricate :review, business: business, rating: 4, user: Fabricate(:user)
        Fabricate :review, business: business, rating: 5, user: Fabricate(:user)

        expect(business.rating).to eq(4)
      end
    end
  end
end

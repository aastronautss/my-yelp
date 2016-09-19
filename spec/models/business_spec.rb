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
end

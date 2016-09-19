require 'rails_helper'

describe Review do
  context 'validations' do
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:business) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:business) }
  end
end

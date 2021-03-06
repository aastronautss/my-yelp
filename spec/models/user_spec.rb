require 'rails_helper'

describe User do
  context 'validations' do
    it { should have_secure_password }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  context 'associations' do
    it { should have_many(:reviews).dependent(:destroy) }
  end
end

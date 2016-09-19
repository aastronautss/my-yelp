class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validates_presence_of :rating, :body, :user, :business

  validates_uniqueness_of :user_id,
    scope: :business_id,
    message: 'cannot leave more than one review for a business'

  self.per_page = 10
end

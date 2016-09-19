class Business < ActiveRecord::Base
  has_many :reviews, -> { order 'created_at DESC' }, dependent: :destroy

  validates_presence_of :name, :address, :city, :state, :zip

  self.per_page = 10

  delegate :count, to: :reviews, prefix: 'review'

  def rating
    ratings = reviews.map &:rating
    return nil if ratings.empty?
    ratings.inject { |sum, el| sum + el }.to_f / ratings.length
  end
end

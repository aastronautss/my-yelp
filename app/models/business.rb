class Business < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates_presence_of :name, :address, :city, :state, :zip

  self.per_page = 10

  def rating
    ratings = reviews.map &:rating
    return nil if ratings.empty?
    ratings.inject { |sum, el| sum + el }.to_f / ratings.length
  end
end

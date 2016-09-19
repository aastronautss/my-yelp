class Business < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates_presence_of :name, :address, :city, :state, :zip

  self.per_page = 10

  def rating # TODO
    3.4
  end
end

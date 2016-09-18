class Business < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :zip
end

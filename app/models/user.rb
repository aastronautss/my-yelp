class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_uniqueness_of :email, case_sensitive: false
end

class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews, -> { order 'created_at DESC' }, dependent: :destroy

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_uniqueness_of :email, case_sensitive: false

  def full_name
    "#{first_name} #{last_name}"
  end
end

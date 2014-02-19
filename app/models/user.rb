class User < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
  # has_and_belongs_to_many :listings

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates_confirmation_of :password

end
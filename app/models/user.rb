class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates_confirmation_of :password

  before_save :hash_password

  has_many :favorites, dependent: :destroy
  # has_and_belongs_to_many :listings

  def password_changed?
    !@password.blank?
  end

  def self.authenticate(email, password)
    if user = find_by_email(email)
      if BCrypt::Password.new(user.hash_password).is_password? password
        return user
      end
    end

    return nil
  end

  def hash_password
    binding.pry
    self.password_digest = BCrypt::Password.create(@user)
    #when registering, BCrypt errors out as an uninitialized constant
    #even after adding to Gem file, bundle installing,
    #and restarting server 

  end

end
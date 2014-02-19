class Area < ActiveRecord::Base
  has_many :listings

  validates :zip, :numericality => {:only_integer => true}
end
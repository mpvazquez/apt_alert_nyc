class Listing < ActiveRecord::Base
  belongs_to :area

  validates :beds, :numericality => {:only_integer => true}
  validates :baths, :numericality => {:only_integer => true}
  validates :price, :numericality => {:only_integer => true}
  validates :zip, :numericality => {:only_integer => true}

  # has_and_belongs_to_many :users

end
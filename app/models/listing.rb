class Listing < ActiveRecord::Base
  validates :beds, :numericality => {:only_integer => true}
  validates :baths, :numericality => {:only_integer => true}
  validates :price, :numericality => {:only_integer => true}
end
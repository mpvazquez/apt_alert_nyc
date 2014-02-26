class Area < ActiveRecord::Base
  has_many :listings

  # validates :zip, :numericality => {:only_integer => true}, if: :entered_zip?

  # def entered_zip?
  #   params[:zip].blank?
  # end
end
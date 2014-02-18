class ListingsController < ApplicationController

  def index
    @listing = Listing.new
  end
end

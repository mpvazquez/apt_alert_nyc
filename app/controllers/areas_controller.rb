class AreasController < ApplicationController

  before_action :load_area, only: [:show]
  before_action :load_all, only: [:index, :show]

  def index
    get_listing_data
  end

  def show
  end

  private

  def load_area
    @area = Area.find(params[:id])
  end

  def load_all
    @areas = Area.all
  end

  private

  def get_listing_data
    encoded_url = URI.encode("http://streeteasy.com/nyc/for-rent/nyc/zip:#{params[:zip]}")
    listings = Nokogiri::HTML(open(encoded_url)).css('.item_inner')

    @final_output = listings.map do |listing|
      output = {}
      output[:neighborhood] = listing.css("div.details_info a").inner_html
      output
    end
  end

end
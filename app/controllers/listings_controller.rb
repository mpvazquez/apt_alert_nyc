class ListingsController < ApplicationController
  include SetListingAreaHelper

  def index
    @listing = Listing.new
    @area = Area.find_by(id: params[:areas])
    get_listing_data
  end

  def search
    @listing = Listing.new

    get_listing_data
  end

  def create
    @listing = Listing.find(@area_id)

    @favorite_creator = Area.find_by(title: "params[:neighborhood]")
  end

  # def favorite
  #   @listing = Listing.find(params[:id])
  #     current_user.listings << @Listing
  #     redirect_to listing_path
  # end

  # def unfavorite
  #   @listing = Listing.find(params[:id])
  #     current_user.listings.delete(@listing)
  #     redirect_to listing_path
  # end


  private

  def configure_query_url
    base_url = ["http://streeteasy.com/nyc/for-rent/"]
  end

  def get_listing_data
    encoded_url = URI.encode("http://streeteasy.com/nyc/for-rent/nyc/status:open%7Cprice:#{params[:min_price]}-#{params[:max_price]}%7Czip:#{params[:zip]}%7Cbeds:#{params[:beds]}%7Cbaths>=#{params[:baths]}")
    listings = Nokogiri::HTML(open(encoded_url)).css('.item_inner')

    @final_output = listings.map do |listing|
      output = {}
      
      if listing.css("div.photo img").attr("src").value.include?(".png")
        output[:image_url] = "http://streeteasy.com" + listing.css("div.photo img").attr("src").value
      else 
        output[:image_url] = listing.css("div.photo img").attr("src").value
      end
      output[:address] = listing.css("div.details_title a").first.inner_html
      output[:price] = listing.css("div.details_info span.price").inner_html
      output[:neighborhood] = listing.css("div.details_info a").inner_html
      output[:beds] = listing.css("div.details_info span.first_detail_cell").inner_html
      output[:baths] = listing.css("div.details_info span.last_detail_cell").inner_html
      link = listing.css("div.photo a").attr("href").value
      output[:listing_link] = "http://streeteasy.com" + link

      area_id = Area.find_by(title: output[:neighborhood])

      output
    end

  end

end

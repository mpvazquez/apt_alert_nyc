class ListingsController < ApplicationController

  def index
    @listing = Listing.new

    get_listing_data
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

  def get_listing_data
    encoded_url = URI.encode("http://streeteasy.com/nyc/for-rent/nyc/status:open%7Cprice:#{params[:min_price]}-#{params[:max_price]}%7Czip:#{params[:zip]}%7Cbeds:#{params[:beds]}%7Cbaths>=#{params[:baths]}")
    listings = Nokogiri::HTML(open(encoded_url)).css('.item_inner')

    @final_output = listings.map do |listing|
      output = {}
      output[:image_url] = listing.css("div.photo img").attr("src").value
      output[:address] = listing.css("div.details_title a").first.inner_html
      output[:price] = listing.css("div.details_info span.price").inner_html
      output[:neighborhood] = listing.css("div.details_info a").inner_html
      output[:beds] = listing.css("div.details_info span.first_detail_cell").inner_html
      output[:baths] = listing.css("div.details_info span.last_detail_cell").inner_html
      link = listings.css("div.photo a").attr("href").value
      output[:listing_link] = "http://streeteasy.com" + link

      output
    end

  end

end
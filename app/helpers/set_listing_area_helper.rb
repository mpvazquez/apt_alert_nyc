module SetListingAreaHelper
  def locate_by_zip(zipcode)

    encoded_url = URI.encode("http://streeteasy.com/nyc/for-rent/nyc/zip:#{zipcode}")
    listings = Nokogiri::HTML(open(encoded_url)).css('.item_inner')

    neighborhood_finder = listings.map do |listing|
      listing[:neighborhood] = listing.css("div.details_info a").inner_html
    end

    zip_neighborhoods = Area.where(title: neighborhood_finder)

    if zip_neighborhoods.last == zip_neighborhoods.first
      "Just one thing here!"
    else 
      @area_array = []

      zip_neighborhoods.each do |a|
        @area_array << a.se_id
      end
    end
  end
end
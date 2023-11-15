require 'nokogiri'
require 'open-uri'

class AirbnbScraper
  def self.scrape_top_reviews_by_city(num_houses, cities)
    # Specify the base URL for Airbnb homes
    base_url = 'https://www.airbnb.com/s/'

    # Create an array to store information about top-reviewed houses
    top_reviewed_houses = []

    cities.each do |city|
      # Construct the URL for the specific city
      city_url = "#{base_url}#{city}/homes"

      # Use Nokogiri and OpenURI to fetch and parse the HTML content of the city page
      doc = Nokogiri::HTML(URI.open(city_url))
      cards = doc.at('.gsgwcjk.g8ge8f1.g14v8520.dir.dir-ltr').css('.dir.dir-ltr')

      titles = []

      cards.first(1).each do |card|
        title = card.at('.c4mnd7m.dir.dir-ltr .c1l1h97y.dir.dir-ltr')
        titles << title
        binding.pry
      end



      # Iterate over each house element on the page
      # doc.css('gsgwcjk g8ge8f1 g14v8520 dir dir-ltr').first(num_houses).each do |house|
        # Extract information about each house
        # title = house.css('t1jojoys dir dir-ltr').text.strip
        # subtitle = house.css('span.t6mzqp7').text.strip
        # pricing = house.css('div._i5duul span._1ks8cgb').text.strip
        # rating =  house.css('span.r1dxllyb').text.strip
        # pet_friendly = house.css('div._yya4a3').text.downcase.include?('pet friendly')

        # Extract the image URL of the house
        # image_url = house.css('div.dqra4ro img.itu7ddv').attr('data-original-uri')&.text

        # Create a hash with the extracted information for the current house
    #     house_data = {
    #       title: title,
    #       # subtitle: subtitle,
    #       # pricing: pricing,
    #       # rating: rating,
    #       # pet_friendly: pet_friendly ? 1 : 0,
    #       # image_url: image_url,
    #       # city: city
    #     }

    #     # Add the house data hash to the array
    #     top_reviewed_houses << house_data
    #   end
    end

  #   # Sort the houses by ranking in descending order
  #   top_reviewed_houses.sort_by! { |house| -house[:ranking].to_i }

  #   # Return the top-reviewed houses
  #   top_reviewed_houses.take(num_houses)
  end
end

require 'httparty'
require 'json'

class BeerService
  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def beer_response
    JSON.parse(self.class.get("https://api.punkapi.com/v2/beers").body)

  end

end

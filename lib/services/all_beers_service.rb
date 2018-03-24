require 'httparty'
require 'json'

class AllBeersService
  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def all_beers_response
    JSON.parse(self.class.get("https://api.punkapi.com/v2/beers").body)

  end

end

require 'httparty'
require 'json'

class AllBeersService

  attr_reader :json_beer_file

  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def all_beers_response
    @json_beer_file = JSON.parse(self.class.get("https://api.punkapi.com/v2/beers").body)

  end

end

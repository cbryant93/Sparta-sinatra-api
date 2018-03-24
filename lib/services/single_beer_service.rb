require 'httparty'
require 'json'

class SingleBeerService
  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def single_beer_response(id)
    JSON.parse(self.class.get("/beers/#{id}").body)

  end

end

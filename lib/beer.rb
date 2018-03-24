require "json"
require "httparty"
require_relative "./services/beer_service"

class Beerio
  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def beer_service
    BeerService.new
  end

end

x = Beerio.new

print x.beer_service.beer_response

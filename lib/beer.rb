require "json"
require "httparty"
require_relative "./services/all_beers_service"
require_relative "./services/single_beer_service"


class Beerio
  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def all_beers_service
    AllBeersService.new
  end

  def single_beer_service
    SingleBeerService.new
  end
  


end

x = Beerio.new

# print x.single_beer_service.single_beer_response(1)

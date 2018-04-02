require 'httparty'
require 'json'

class SingleBeerService

  attr_reader :json_single_beer_file

  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def single_beer_response(id)
    @json_single_beer_file = JSON.parse(self.class.get("/beers/#{id}").body)

  end

  def beer_id
  json_single_beer_file.first["id"]
  end

  def name
  json_single_beer_file.first["name"]
  end

  def first_brewed
    json_single_beer_file.first["first_brewed"]
  end

  def abv
    json_single_beer_file.first["abv"]
  end

  def ibu
    json_single_beer_file.first["ibu"]
  end

end

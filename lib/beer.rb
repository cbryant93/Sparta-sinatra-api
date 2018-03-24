require "json"
require "httparty"

class Beer
  attr_reader :json_file
  include HTTParty

  base_uri "https://api.punkapi.com/v2/"

  def initialize(beer)
    @json_file = JSON.parse(self.class.get("https://api.punkapi.com/v2/beers"))
  end

end

class StaticController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :view, Proc.new { File.join(root,"views")}

  configure :development do
    register Sinatra::Reloader
  end

  def index
  json = HTTParty.get("https://api.punkapi.com/v2/beers").body

  @all_beers = JSON.parse(json)
   @all_beers.each do |beers|
   end
  end

  # Landing Page
  get '/' do
    @title = "List of PUNK beers"

    @all_beers = $beers

    erb :'posts/index'
  end
end

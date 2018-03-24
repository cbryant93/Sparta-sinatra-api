class BeerController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :view, Proc.new { File.join(root,"views")}

  configure :development do
    register Sinatra::Reloader
  end

  def index
  json = HTTParty.get("https://api.punkapi.com/v2/beers").body

  @all_beers = JSON.parse(json)

  end

  # Landing Page
  post '/' do

    @all_beers = $beers

    new_post = {
      @all_beers["name"] => params[:name]
    }

    $beers.push(new_post)

    redirect "/"

  end
end

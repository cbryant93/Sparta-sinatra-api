require_relative '../lib/beer'

class StaticController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :view, Proc.new { File.join(root,"views")}

  configure :development do
    register Sinatra::Reloader
  end


  # Landing Page
  get '/' do
    @title = "List of PUNK beers"

    @beerio = Beerio.new

    $allresponse = @beerio.all_beers_service.all_beers_response

    @allresponse = $allresponse

    erb :'posts/index'
  end
end

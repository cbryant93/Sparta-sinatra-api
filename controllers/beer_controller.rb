require_relative '../lib/beer'

class BeerController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :view, Proc.new { File.join(root,"views")}

  configure :development do
    register Sinatra::Reloader
  end

  def index

    before(:all) do
      @beerio = Beerio.new
      $allresponse = @beerio.all_beers_service.all_beers_response
    end

  end

  # Landing Page
  post '/' do

    @allresponse = $allresponse

    redirect "/"

  end
end

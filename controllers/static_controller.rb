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

  post '/' do

    @allresponse = $allresponse

    redirect "/"

  end

  get '/:id' do

    @title = "Beer Info"

    id = params[:id]

    @beerio = Beerio.new


    $single_response = @beerio.single_beer_service.single_beer_response(id)

    @single_response = $single_response

    erb :'posts/show'

end

# put '/:id'  do
#
#   @beerio = Beerio.new
#
#   $single_response = @beerio.single_beer_service.single_beer_response(:id)
#
#
#   redirect '/'
#
#   end

end

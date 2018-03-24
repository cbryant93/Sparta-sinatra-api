class StaticController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :view, Proc.new { File.join(root,"views")}

  configure :development do
    register Sinatra::Reloader
  end

  # Landing Page
  get '/' do
    @title = "List of PUNK beers"
  end
end

require 'sinatra'
require 'sinatra/reloader' if development?
require_relative "./controllers/static_controller"
require_relative "./controllers/beer_controller"

use Rack::MethodOverride

run Rack::Cascade.new([
  StaticController,
  BeerController
])

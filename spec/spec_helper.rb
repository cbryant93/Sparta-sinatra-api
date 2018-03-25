require 'rspec'
require_relative '../lib/beer'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end

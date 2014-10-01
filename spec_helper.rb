require 'rspec'
require 'rack/test'
require 'byebug'
require_relative 'player_service'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

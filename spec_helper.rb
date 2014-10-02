require 'rspec'
require 'rack/test'
require 'byebug'
require_relative 'player_service'
require_relative 'game_data_parser'
require_relative 'card'
require_relative 'table'
require_relative 'cards_factory'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

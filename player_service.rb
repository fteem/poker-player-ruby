require 'sinatra'
require 'json'
require_relative 'player'
require_relative 'game_data_parser'
require_relative 'card'
require_relative 'table'
require_relative 'cards_factory'
require_relative 'hole_cards'

use Rack::Logger

set :port, 8090
set :bind, '0.0.0.0'

helpers do
  def logger
    request.logger
  end
end

post "/" do
  logger.info params

  if params[:action] == 'bet_request' #return an integer
    data   = GameDataParser.new(params)
    table  = Table.new(data.table_data)
    player = Player.new(data.player, table)

    player.bet_request
  elsif params[:action] == 'showdown'
    # Player.new.showdown(JSON.parse(params[:game_state]))
    'OK'
  elsif params[:action] == 'version'
    Player::VERSION
  else
    'OK'
  end
end

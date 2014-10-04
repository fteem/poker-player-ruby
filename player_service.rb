require 'sinatra'
require 'json'
require_relative 'player'
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

  data   = GameDataParser.new(params)
  table  = Table.new(data.table_data)
  player = Player.new(data.player, table)

  if params[:action] == 'bet_request' #return an integer
    player.bet_request
  elsif params[:action] == 'showdown'
    Player.new.showdown(JSON.parse(params[:game_state]))
    'OK'
  elsif params[:action] == 'version'
    Player::VERSION
  else
    'OK'
  end
end

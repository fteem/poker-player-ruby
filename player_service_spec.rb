require_relative 'spec_helper'

describe 'Player Service' do

  def app
    Sinatra::Application
  end

  it 'responds to check request' do
    post '/', action: 'check'
    expect(last_response.status).to eq 200
    expect(last_response.body).to eq "OK"
  end

  it 'responds to bet_request request' do
    post '/', action: 'bet_request', game_state: "{\"some\": \"flag\"}"
    expect(last_response.body).to eq "0"
    expect(last_response.status).to eq 200
  end

  it 'responds to version request' do
    Player::VERSION = '123'
    post '/', action: 'version'
    expect(last_response.body).to eq '123'
  end

  it 'responds to showdown request' do
    post '/', action: 'showdown', game_state: "{\"some\": \"flag\"}"
    expect(last_response.body).to eq 'OK'
    expect(last_response.status).to eq 200
  end
end

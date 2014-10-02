require 'json'

class GameDataParser

  def initialize(raw_json)
    @json = JSON.parse(raw_json)
  end

  def player
    @player ||= @json['players'].detect do |player|
      player.has_key?('hole_cards')
    end
  end

  def opponents
    @json['players'].select do |p|
      p['id'] != player['id']
    end
  end

  def community_cards
    @json['community_cards']
  end

  def table_data
    {
      'community_cards' => @json['community_cards'],
      'small_blind' => @json['small_blind'],
      'orbits' => @json['orbits'],
      'dealer' => @json['dealer'],
      'current_buy_in' => @json['current_buy_in'],
      'pot' => @json['pot'],
      'in_action' => @json['in_action'],
      'minimum_raise' => @json['minumum_raise']
    }
  end
end

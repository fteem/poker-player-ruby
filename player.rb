
class Player

  VERSION = "Default Ruby folding player"

  attr_reader :hole_cards, :name, :stack, :bet, :id

  def initialize(player_data)
    @hole_cards = CardsFactory.build(player_data['hole_cards'])
    @name = player_data['name']
    @stack = player_data['stack']
    @bet = player_data['bet']
    @id = player_data['id']
  end

  def bet_request(game_state)
    0
  end

  def showdown(game_state)

  end
end

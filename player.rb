
class Player

  VERSION = "Default Ruby folding player"

  attr_reader :hole_cards, :name, :stack, :bet, :id

  def initialize(player_data, table = nil)
    @hole_cards = HoleCards.new(
        Card.new(player_data['hole_cards'].first),
        Card.new(player_data['hole_cards'].last)
    )

    @name  = player_data['name']
    @stack = player_data['stack']
    @bet   = player_data['bet']
    @id    = player_data['id']
  end

  def bet_request
    bet = 0
    if @hole_cards.pair?
      bet = table.minimum_raise * 2
    else
      bet = 0
    end
    bet.to_s
    # make the bet a string (#to_s)
  end

  def showdown(game_state)

  end
end

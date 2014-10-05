
class Player

  VERSION = "Default Ruby folding player"

  attr_reader :hole_cards, :name, :stack, :bet, :id, :table

  def initialize(player_data, table = nil)
    @hole_cards = HoleCards.new(
        Card.new(player_data['hole_cards'].first),
        Card.new(player_data['hole_cards'].last)
    )

    @name  = player_data['name']
    @stack = player_data['stack']
    @bet   = player_data['bet']
    @id    = player_data['id']
    @table = table
  end

  def bet_request
    bet = 0
    if @hole_cards.pair?
      bet = table.pot * 2
    elsif @hole_cards.straightable? || @hole_cards.straight_flushable?
      bet = table.mininum_raise
    elsif @hole_cards.in_suit?
      bet = table.minimum_raise * 1.5
    else
      bet = 0
    end
    puts "BETTING: #{bet}"
    bet.to_s
  end

  def showdown(game_state)

  end
end

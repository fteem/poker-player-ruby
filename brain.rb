class Brain

  def initialize table, hole_cards, stack
    @stack           = stack
    @hole_cards      = hole_cards
    @current_buy_in  = table.current_buy_in
    @pot             = table.pot
    @community_cards = table.community_cards
  end

  def decide
    if on_flop?
      return false if has_low_pair?
      return true  if has_high_pair?
    end

    return false if !@hole_cards.pair? && !@hole_cards.high_card?
    return false if @hole_cards.low_pair? && buy_in_eligible_for_chip_stack?

  end

  private

  def on_flop?
    @community_cards.length == 3
  end

  def on_turn?
    @community_cards.length == 4
  end

  def on_river?
    @community_cards.length == 5
  end

  def buy_in_eligible_for_chip_stack?
    5 >= (@current_buy_in / @stack) * 100
  end

  # This ideally should be a class/collection of all cards
  def all_cards
    @community_cards + [@hole_cards.card1, @hole_cards.card2]
  end

  def has_low_pair?
    ranks = all_cards.collect { |c| c.rank }
    pair = ranks.detect {|e| ranks.rindex(e) != ranks.index(e) }
    return true if !['J', 'Q', 'K', 'A'].include? pair
  end

  def has_high_pair?
    !has_low_pair?
  end
end

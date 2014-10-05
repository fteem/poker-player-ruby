class HoleCards
  CARDS_ORDER_ONE = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  CARDS_ORDER_TWO = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  HIGH_CARDS      = CARDS_ORDER_ONE[8..-1]

  attr_reader :card1, :card2

  def initialize(card1, card2)
    @card1 = card1
    @card2 = card2
  end

  def high_card?
    HIGH_CARDS.include?(@card1.rank) || HIGH_CARDS.include?(@card2.rank)
  end

  def pair?
    @card1.rank == @card2.rank
  end

  def in_suit?
    @card1.suit == @card2.suit
  end

  def off_suit?
    !in_suit?
  end

  def straightable?
    if @card1.rank == 'A' || @card2.rank == 'A'
      cards_within_range_of_five_for?(CARDS_ORDER_ONE) || cards_within_range_of_five_for?(CARDS_ORDER_TWO)
    else
      cards_within_range_of_five_for?(CARDS_ORDER_ONE)
    end
  end

  def straight_flushable?
    in_suit? && straightable?
  end

  private

  def cards_within_range_of_five_for?(order)
    card1_idx = order.index(card1.rank)
    card2_idx = order.index(card2.rank)

    if card1_idx > card2_idx
      card1_idx - card2_idx < 5
    else
      card2_idx - card1_idx < 5
    end
  end

end

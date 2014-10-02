class Card
  attr_reader :rank, :suit

  def initialize(card_data)
    @rank = card_data['rank']
    @suit = card_data['suit']
  end
end

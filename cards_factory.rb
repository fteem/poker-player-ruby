class CardsFactory
  class << self
    def build(data)
      data.collect do |card_data|
        Card.new card_data
      end
    end
  end
end

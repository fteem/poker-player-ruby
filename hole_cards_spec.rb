require_relative 'spec_helper'

describe HoleCards do
  let(:card1) { Card.new({ 'rank' => 'A', 'suit' => 'spades'}) }
  let(:card2) { Card.new({ 'rank' => 'K', 'suit' => 'diamonds'}) }
  let(:hole_cards) { described_class.new(card1, card2) }

  it 'is container for the player cards' do
    expect(hole_cards.card1.rank).to eq 'A'
    expect(hole_cards.card2.rank).to eq 'K'
  end

  it '#high_card? - returns true if any of the cards are J/Q/K/A' do
    expect(hole_cards.high_card?).to eq true
  end

  it '#pair? - returns true when cards are a pocket pair' do
    card2.rank = 'A'
    expect(hole_cards.pair?).to eq true
  end

  it '#in_suit? - returns true when cards are in the same suit' do
    card2.suit = 'spades'
    expect(hole_cards.in_suit?).to eq true
  end

  it '#off_suit? - opposite of #in_suit?' do
    expect(hole_cards.off_suit?).to eq true
  end

  describe '#straighable? - cards can create a straight' do
    context 'valid combinations' do
      it 'two consecutive cards are straightable' do
        card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => 'K', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq true
      end

      it 'cards separated with one card are straightable' do
        card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => 'Q', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq true
      end

      it 'cards separated with two card are straightable' do
        card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => 'J', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq true
      end

      it 'cards separated with three card are straightable' do
        card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => '10', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq true
      end

      it 'A and 5 are straightable' do
        card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => '5', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq true
      end
    end

    context 'cards separate with more then three cards are not straightable' do
      it 'invalid case 1' do
        card1      = Card.new({ 'rank' => '10', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => '5', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq false
      end

      it 'invalid case 2' do
        card1      = Card.new({ 'rank' => '2', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => '10', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq false
      end

      it 'invalid case 3' do
        card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
        card2      = Card.new({ 'rank' => '6', 'suit' => 'diamonds'})
        hole_cards = described_class.new(card1, card2)
        expect(hole_cards.straightable?).to eq false
      end
    end
  end

  describe '#staight_flushable?' do
    it 'returns true if cards have same suit and are straightable?' do
      card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
      card2      = Card.new({ 'rank' => 'K', 'suit' => 'spades'})
      hole_cards = described_class.new(card1, card2)
      expect(hole_cards.straight_flushable?).to eq true
    end

    it 'returns false if cards have same suit and are NOT straightable?' do
      card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
      card2      = Card.new({ 'rank' => '8', 'suit' => 'spades'})
      hole_cards = described_class.new(card1, card2)
      expect(hole_cards.straight_flushable?).to eq false
    end

    it 'returns false if cards have same suit and are NOT straightable?' do
      card1      = Card.new({ 'rank' => 'A', 'suit' => 'spades'})
      card2      = Card.new({ 'rank' => 'K', 'suit' => 'hearts'})
      hole_cards = described_class.new(card1, card2)
      expect(hole_cards.straight_flushable?).to eq false
    end
  end

end

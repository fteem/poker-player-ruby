require_relative 'spec_helper'

describe Brain do

  context '*before flop*' do
    it 'folds if hole cards are an off pair with no high card' do
      hole_cards = HoleCards.new(Card.new({ 'rank' => '2', 'suit' => 'spades'}), Card.new({ 'rank' => '7', 'suit' => 'diamonds'}))
      table = double(Table, current_buy_in: 10, pot: 30, community_cards: [])
      expect(Brain.new(table, hole_cards, 1000).decide).to eq false
    end

    it 'folds if hole cards are a low pair when minimum_raise is more than 5% of player chip stack' do
      c1 = Card.new({ 'rank' => '7', 'suit' => 'spades'})
      c2 = Card.new({ 'rank' => '7', 'suit' => 'diamonds'})
      table = double(Table, current_buy_in: 150, pot: 30, community_cards: [])
      hole_cards = HoleCards.new(c1, c2)
      expect(Brain.new(table, hole_cards, 1000).decide).to eq false
    end
  end

  context '*on flop*' do
    it "folds if hole cards dont make atleast a pair" do
      c1 = Card.new({ 'rank' => '2', 'suit' => 'spades'})
      c2 = Card.new({ 'rank' => '7', 'suit' => 'diamonds'})
      table = double(Table, current_buy_in: 150, pot: 30, community_cards: [double(Card, rank: '2'), double(Card, rank: '10'), double(Card, rank: '8')])
      hole_cards = HoleCards.new(c1, c2)
      expect(Brain.new(table, hole_cards, 1000).decide).to eq false
    end

    it "calls/checks if player has a pair" do
      c1 = Card.new({ 'rank' => '2', 'suit' => 'spades'})
      c2 = Card.new({ 'rank' => '7', 'suit' => 'diamonds'})
      table = double(Table, current_buy_in: 150, pot: 30,
          community_cards: [Card.new({ 'rank' => '7', 'suit' => 'hearts'}), double(Card, rank: '3'), double(Card, rank: '4')])
      hole_cards = HoleCards.new(c1, c2)
      expect(Brain.new(table, hole_cards, 1000).decide).to eq true
    end

    it "folds if player has a *weak* pair but minimum_raise is more than 10% of the player's chip stack" do
    end

    it "checks if player has a *strong* pair"
    it "checks if player has two pairs"
    it "calls if player has three-of-a-kind"
    it "calls if player has four-of-a-kind"
    it "calls if player has straight"
    it "calls if player has flush"
    it "calls if player has straight flush"
  end

  context '*on turn*' do
    it "folds if player has a *strong* pair"
    it "checks if player has three-of-a-kind"
    it "calls if player has two pairs"
    it "calls if player has four-of-a-kind"
    it "calls if player has straight"
    it "calls if player has flush"
    it "goes all-in player has straight flush"
  end

   context '*on river*' do
    it "checks/calls if player has three-of-a-kind"
    it "checks/calls if player has two pairs"
    it "goes all-in if player has four-of-a-kind"
    it "calls/raises if player has straight"
    it "calls/raises if player has flush"
    it "goes all-in player has straight flush"
   end

end

require_relative 'spec_helper'

describe Table do
  let(:table_data) do
    {
      "small_blind" => 10,
      "orbits" => 0,
      "dealer" => 1,
      "community_cards" => [
        {"rank" => "8","suit" => "diamonds"},
        {"rank" => "Q","suit" => "spades"}
      ],
      "current_buy_in" => 20,
      "pot" => 30,
      "in_action" => 0,
      "minimum_raise" => 10
    }
  end

  let(:table){ described_class.new(table_data) }

  it '#small_blind' do
    expect(table.small_blind).to eq 10
  end

  it '#orbits' do
    expect(table.orbits).to eq 0
  end

  # TODO: Make it a Player instance
  it '#dealer' do
    expect(table.dealer).to eq 1
  end

  it '#community_cards - collection of community cards' do
    community_cards = table.community_cards
    expect(community_cards).to be_kind_of Array
    expect(community_cards.first).to be_kind_of Card
    expect(community_cards.first.rank).to eq '8'
    expect(community_cards.first.suit).to eq 'diamonds'
    expect(community_cards.last.rank).to eq 'Q'
    expect(community_cards.last.suit).to eq 'spades'
  end

  it '#current_buy_in' do
    expect(table.current_buy_in).to eq 20
  end

  it '#pot' do
    expect(table.pot).to eq 30
  end

  # TODO: Make it a Player instance
  it '#in_action' do
    expect(table.in_action).to eq 0
  end

  it '#minimum_raise' do
    expect(table.minimum_raise).to eq 10
  end

end

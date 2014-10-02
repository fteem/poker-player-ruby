require_relative 'spec_helper'

describe CardsFactory do
  let(:raw_data) do
   [
     {"rank" => "8","suit" => "diamonds"},
     {"rank" => "Q","suit" => "spades"}
   ]
  end

  it 'builds a list or cards from raw data' do
    cards_list = described_class.build(raw_data)
    expect(cards_list.first).to be_kind_of Card
    expect(cards_list.first.rank).to eq '8'
    expect(cards_list.first.suit).to eq 'diamonds'
    expect(cards_list.last).to be_kind_of Card
    expect(cards_list.last.rank).to eq 'Q'
    expect(cards_list.last.suit).to eq 'spades'
  end
end

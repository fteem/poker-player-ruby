require_relative 'spec_helper'

describe Card do
  let(:card_data) { { 'suit' => 'diamonds', 'rank' => '9' } }
  let(:card) { described_class.new(card_data) }
  it '#rank - returns card rank' do
    expect(card.rank).to eq '9'
  end

  it '#suit - returns card suit' do
    expect(card.suit).to eq 'diamonds'
  end
end

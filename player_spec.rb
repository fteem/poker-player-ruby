require_relative 'spec_helper'

describe Player do

  let(:data) do
    {
      "name" => "Rudy Ruby",
      "stack" => 990,
      "status" => "active",
      "bet" => 10,
      "hole_cards" => [
        {"rank" => "8","suit" => "hearts"},
        {"rank" => "Q","suit" => "hearts"}
      ],
      "version" => "Default Ruby folding player",
      "id" => 0
    }
  end

  let(:player) { described_class.new(data) }

  it "#hole_cards - the player's whole cards" do
    expect(player.hole_cards).to be_kind_of Array
    expect(player.hole_cards.first.rank).to eq '8'
  end

  it "#name - the player's name" do
    expect(player.name).to eq "Rudy Ruby"
  end

  it "#stack - player's stack" do
    expect(player.stack).to eq 990
  end

  it "#bet - player's bet" do
    expect(player.bet).to eq 10
  end

  it "#id - player's id number" do
    expect(player.id).to eq 0
  end
end

require_relative 'spec_helper'

describe GameDataParser do
  let(:raw_json) do
    "{
      \"players\":
      [
        {
          \"name\":\"Rudy Ruby\",
          \"stack\":990,
          \"status\":\"active\",
          \"bet\":10,
          \"hole_cards\":[
            {\"rank\":\"8\",\"suit\":\"hearts\"},
            {\"rank\":\"Q\",\"suit\":\"hearts\"}
          ],
          \"version\":\"Default Ruby folding player\",
          \"id\":0
        },
        {
          \"name\":\"REST\",
          \"stack\":980,
          \"status\":\"active\",
          \"bet\":20,
          \"version\":\"Default Ruby folding player\",
          \"id\":1
        }
      ],
      \"small_blind\":10,
      \"orbits\":0,
      \"dealer\":1,
      \"community_cards\":[
        {\"rank\":\"8\",\"suit\":\"diamonds\"},
        {\"rank\":\"Q\",\"suit\":\"spades\"}
      ],
      \"current_buy_in\":20,
      \"pot\":30,
      \"in_action\":0,
      \"minimum_raise\":10
    }"

  end

  let(:mapper){ described_class.new(raw_json)}

  it '#player - maps player data' do
    expect(mapper.player).to be_kind_of(Hash)
    expect(mapper.player['name']).to eq "Rudy Ruby"
    expect(mapper.player['status']).to eq "active"
  end

  it '#opponents - maps opponent players data' do
    opponent = mapper.opponents.first
    expect(opponent).to be_kind_of(Hash)
    expect(opponent['name']).to eq "REST"
    expect(opponent['bet']).to eq 20
  end

  it '#community_cards - maps community cards data' do
    community_cards = mapper.community_cards
    expect(community_cards).to be_kind_of(Array)
    expect(community_cards.first).to be_kind_of(Hash)
    expect(community_cards.first['rank']).to eq '8'
    expect(community_cards.first['suit']).to eq 'diamonds'
  end

end

class Table
  attr_reader :small_blind, :orbits, :dealer, :current_buy_in, :pot, :in_action,
    :minimum_raise, :community_cards

  def initialize(table_data)
    @small_blind = table_data['small_blind']
    @orbits = table_data['orbits']
    @dealer = table_data['dealer']
    @current_buy_in = table_data['current_buy_in']
    @pot = table_data['pot']
    @in_action = table_data['in_action']
    @minimum_raise = table_data['minimum_raise']
    @community_cards ||= CardsFactory.build table_data['community_cards']
  end

end

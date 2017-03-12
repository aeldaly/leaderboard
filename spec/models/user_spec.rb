require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }

  describe '#games' do
    let!(:game_1) { create(:game, winner: user_1, loser: user_2) }
    let!(:game_2) { create(:game, winner: user_2, loser: user_1, date: Date.yesterday) }

    let(:games) do
      games = ActiveSupport::OrderedHash.new

      games[Date.today] = [{
        opponent: user_2.email,
        result: 'W',
        score: "21 - 19"
      }]

      games[Date.yesterday] = [{
        opponent: user_2.email,
        result: 'L',
        score: "19 - 21"
      }]

      games
    end

    it { expect(user_1.games.size).to eql 2 }
    it { expect(user_1.games).to eql games }
  end
end

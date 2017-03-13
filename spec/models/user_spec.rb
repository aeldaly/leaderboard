# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }

  let(:day_1) { '2017-03-21' }
  let(:day_2) { '2017-03-22' }

  describe '#games' do
    let!(:game_1) { create(:game, winner: user_1, loser: user_2, date: day_1) }
    let!(:game_2) { create(:game, winner: user_2, loser: user_1, date: day_2) }

    let(:games) do
      games = ActiveSupport::OrderedHash.new

      games[day_1] = [{
        opponent: user_2.email,
        result: 'W',
        score: '21 - 19'
      }]

      games[day_2] = [{
        opponent: user_2.email,
        result: 'L',
        score: '19 - 21'
      }]

      games
    end

    it { expect(user_1.games.keys.size).to eql 2 }
    it { expect(user_1.games).to eql games }
  end
end

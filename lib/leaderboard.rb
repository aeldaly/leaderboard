# frozen_string_literal: true

class Leaderboard < ActiveRecord::Base
  WON = 1

  def self.calculate(game)
    winner = game.winner
    loser = game.loser

    winner_rating = Elo::RatedPlayer.new(winner.email, winner.rating)
    loser_rating = Elo::RatedPlayer.new(loser.email, loser.rating)

    ratings = Elo::Match.new(
      winner_rating,
      loser_rating,
      WON
    ).calculate_ratings

    winner.update_attribute(:rating, ratings['player1'])
    loser.update_attribute(:rating, ratings['player2'])
  end
end

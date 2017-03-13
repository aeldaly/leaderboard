# frozen_string_literal: true
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :won_games, class_name: Game, foreign_key: :winner_id
  has_many :lost_games, class_name: Game, foreign_key: :loser_id

  def games
    output = ActiveSupport::OrderedHash.new

    won_games.each do |game|
      game_date = game.date.to_s

      output[game_date] ||= []

      output[game_date] << {
        opponent: game.loser.email,
        result: 'W',
        score: "#{game.winner_score} - #{game.loser_score}"
      }
    end

    lost_games.each do |game|
      game_date = game.date.to_s

      output[game_date] ||= []

      output[game_date] << {
        opponent: game.winner.email,
        result: 'L',
        score: "#{game.loser_score} - #{game.winner_score}"
      }
    end

    output
  end
end

# frozen_string_literal: true
# usage
# require 'elo.rb'

# source: https://github.com/rgho/elo.rb

module Elo
  class RatedPlayer
    # A Rated Player
    attr_accessor :id, :rating # ACTUALLY A SNEAKY METHOD.
    def initialize(id, rating)
      @id = id
      @rating = rating
    end
  end

  class Match
    # A NEW MATCH OBJECT
    def initialize(player1, player2, result)
      @player1 = player1
      @player2 = player2
      @result = result
    end

    def calculate_ratings(k_value = 32, should_round = true)
      # Assign actual individual results
      player1_result = @result
      player2_result = 1 - @result

      # Calculate expected results
      player1_expectation = 1 / (1 + 10**((@player2.rating - @player1.rating) / 400.0)) # the .0 is important to force float operations!))
      player2_expectation = 1 / (1 + 10**((@player1.rating - @player2.rating) / 400.0))

      # Calculate new ratings
      player1_new_rating = @player1.rating + (k_value * (player1_result - player1_expectation))
      player2_new_rating = @player2.rating + (k_value * (player2_result - player2_expectation))

      # Optional rounding
      if should_round
        # int rounds down and forces type
        player1_new_rating = player1_new_rating.round
        player2_new_rating = player2_new_rating.round
      end

      # Create a dictionary to return and do so!
      new_ratings_hash = {}
      new_ratings_hash['player1'] = player1_new_rating
      new_ratings_hash['player2'] = player2_new_rating

      new_ratings_hash
    end
  end
end

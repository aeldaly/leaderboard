# frozen_string_literal: true
class Game < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with GameValidator

  after_create :update_leaderboard

  belongs_to :winner, class_name: User
  belongs_to :loser, class_name: User

  validates :winner, :loser, :date, :winner_score, :loser_score, presence: true
  validates :winner_score, numericality: { greater_than_or_equal_to: 21 }

  private

  def update_leaderboard
    Leaderboard.calculate(self)
  end
end

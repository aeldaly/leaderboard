class Game < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with GameValidator

  belongs_to :winner, class_name: User
  belongs_to :loser, class_name: User

  validates :winner, :loser, :date, :winner_score, :loser_score, presence: true
  validates :winner_score, numericality: { greater_than_or_equal_to: 21 }
end

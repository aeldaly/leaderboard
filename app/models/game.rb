class Game < ActiveRecord::Base
  belongs_to :winner, class_name: User
  belongs_to :loser, class_name: User

  validates :winner, :loser, :date, :winner_score, :loser_score, presence: true
end

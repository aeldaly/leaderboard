# frozen_string_literal: true
class GameValidator < ActiveModel::Validator
  def validate(record)
    if record.winner_score < record.loser_score + 2
      record.errors[:winner] << 'must win by a margin of 2 or more'
    end
  end
end

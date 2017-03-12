# frozen_string_literal: true
FactoryGirl.define do
  factory :game do
    association :winner
    association :loser

    winner_score 21
    loser_score 19

    date { Date.today }
  end
end

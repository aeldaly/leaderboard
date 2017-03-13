class AddRatingToUsers < ActiveRecord::Migration
  def up
    add_column :users, :rating, :integer, default: 0

    User.reset_column_information

    User.update_all(rating: 0)

    Game.all.each do |game|
      Leaderboard.calculate(game)
    end
  end

  def down
    remove_column :users, :rating
  end
end

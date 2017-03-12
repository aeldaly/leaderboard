class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id, null: false
      t.integer :loser_id, null: false

      t.integer :winner_score, null: false
      t.integer :loser_score, null: false

      t.date :date, null: false

      t.timestamps null: false

      t.index :winner_id
      t.index :loser_id
    end
  end
end

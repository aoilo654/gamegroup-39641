class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|

      t.integer :game_id,  null: false
      t.string  :player_name
      t.integer :rank
      t.string  :clan
      t.text    :playstyle
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end

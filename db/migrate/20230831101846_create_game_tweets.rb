class CreateGameTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :game_tweets do |t|
      t.text :tweet,          null: false
      t.text :game_title_id,  null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end

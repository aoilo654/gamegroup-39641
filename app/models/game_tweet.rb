class GameTweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :game_title
  belongs_to :user

  validates :tweet, presence: true
  validates :game_title_id, numericality: { other_than: 0 }
end

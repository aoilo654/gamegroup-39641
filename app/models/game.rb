class Game < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :game_title
  has_one_attached :image

  belongs_to :user

  validates :game_title_id, numericality: { other_than: 0 }
end

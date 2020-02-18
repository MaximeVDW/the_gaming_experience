class Game < ApplicationRecord
  has_many :game_sessions
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :min_player, presence: true
  validates :max_player, presence: true
end

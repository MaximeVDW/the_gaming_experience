class GameSession < ApplicationRecord
  belongs_to :creator, :class_name => 'User'
  belongs_to :player, :class_name => 'User', optional: true
  belongs_to :game

  validates :game, presence: true
  validates :creator, presence: true
  validates :price, presence: true
  validates :date, presence: true
end

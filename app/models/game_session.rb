class GameSession < ApplicationRecord
  belongs_to :creator, :class_name => 'User'
  belongs_to :player, :class_name => 'User', optional: true
  belongs_to :game

  validates :game, presence: true
  validates :creator, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :city, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_city_and_date,
    against: [ :city, :date ],
    using: {
      tsearch: { prefix: true }
    }
end

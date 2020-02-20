class GameSession < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :creator, :class_name => 'User'
  belongs_to :player, :class_name => 'User', optional: true
  belongs_to :game

  validates :game, presence: true
  validates :creator, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :city, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city ],
    associated_against: {
      game: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end

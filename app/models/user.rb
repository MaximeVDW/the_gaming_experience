class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_game_sessions, :class_name => 'GameSession', :foreign_key => 'creator_id'
  has_many :played_game_sessions, :class_name => 'GameSession', :foreign_key => 'player_id'
  has_many :games, through: :game_sessions
  has_one_attached :photo
  mount_uploader :photo, PhotoUploader

  validates :city, presence: true
end

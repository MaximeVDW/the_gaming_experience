class Player::GameSessionsController < ApplicationController
  def index
    #@game_sessions = GameSession.where(player_id: current_user.id)
    #Si bug voir avec Geoffrey
    @game_sessions = GameSession.all
    @image_placeholder = "https://images.pexels.com/photos/3700513/pexels-photo-3700513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"

  end

  def show
    # on se pose la question si celle là n´ est pas inutile...
  end
end

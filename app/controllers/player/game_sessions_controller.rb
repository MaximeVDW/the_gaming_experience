class Player::GameSessionsController < ApplicationController
  def index
    @game_sessions = GameSession.where(player: current_user)
  end

  def show
    # on se pose la question si celle là n´ est pas inutile...
  end
end

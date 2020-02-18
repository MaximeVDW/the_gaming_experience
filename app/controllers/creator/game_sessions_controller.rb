class Creator::GameSessionsController < ApplicationController
  def index
    # idealement on devrait pouvoir ecrire current_user.game_sessions mais par rapport à creator et player....?
    @game_sessions = GameSession.where(creator: current_user)
  end

  def new
    @game_session = GameSession.new
  end

  def create
    @game_session = GameSession.new(game_session_params)
    if @game_session.save
      redirect_to creator_game_sessions_path
    else
      render new_creator_game_session
    end
  end

  private
  def game_session_params
    params.require(:game_session).permit(:game, :date, :booked, :price, :creator)
  end

end

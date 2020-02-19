class Creator::GameSessionsController < ApplicationController
  def index
    # idealement on devrait pouvoir ecrire current_user.game_sessions mais par rapport à creator et player....?
    @game_sessions = GameSession.where(creator: current_user)
    raise
  end

  def new
    @game_session = GameSession.new
  end

  def create
    @game = Game.find_by(name: params[:game_session]["game"])
    @params = game_session_params
    @params[:game] = @game
    @game_session = GameSession.new(@params)
    @creator = current_user
    @game_session.creator = @creator
    if @game_session.save
      redirect_to player_game_sessions_path
    else
      render :new
    end
  end

  private

  def game_session_params
    params.require(:game_session).permit(:date, :price, :city)
  end

end









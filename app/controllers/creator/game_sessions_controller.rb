class Creator::GameSessionsController < ApplicationController
  def index
    # idealement on devrait pouvoir ecrire current_user.game_sessions mais par rapport à creator et player....?
    @game_sessions = GameSession.where(creator: current_user)
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

  def edit
    @game_session = GameSession.find(params[:id])
  end

  def update
    raise
    @game = Game.find(params[:id])
    if @game_session.update(game_session_params)
      redirect_to game_session_path(@game_session)
    else
      render :edit
    end
  end

  def destroy
    @game_session = GameSession.find(params[:id])
    @game_session.destroy
    redirect_to player_game_sessions_path
  end

  private

  def game_session_params
    params.require(:game_session).permit(:date, :price, :city, :game, :description)
  end
end









class Creator::GameSessionsController < ApplicationController
  def index
    # idealement on devrait pouvoir ecrire current_user.game_sessions mais par rapport à creator et player....?
    game_sessions = GameSession.where(creator: current_user)
    @game_sessions = game_sessions.sort_by {|game_session| game_session.date}
  end

  def new
    @game_session = GameSession.new
  end

  def create
    @game = Game.find(params[:game_session]["game"].to_i)
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
    @game_session = GameSession.find(params[:id])
    @game = @game_session.game
    if @game_session.update(game_session_params)
      redirect_to player_game_sessions_path
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









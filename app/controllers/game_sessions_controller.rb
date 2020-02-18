class GameSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_game_session, only: [:show, :edit, :update]

  def index
    @game_sessions = GameSession.all
  end

  def show
  end

  def edit
  end

  def update
    @game_session.update(game_session_params)
    #ajout de render à prévoir
  end

  private

  def game_session_params
    params.require(:game_session).permit(:booked, :player)
  end

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end
end






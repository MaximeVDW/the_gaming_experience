class GameSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @game_sessions = GameSession.all
  end

  def show
    @game_session = GameSession.find(params[:id])
  end

  def edit
    @game_session = GameSession.find(params[:id])
  end

  def update
    @game_session = GameSession.find(params[:id])
    @game_session.update(params)
  end

  private

  def params
    params.require(:game_session).permit(:booked)
  end
end







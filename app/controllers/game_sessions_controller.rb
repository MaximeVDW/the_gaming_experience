class GameSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_game_session, only: [:show, :edit, :update]

  def index

    @image_placeholder = "https://images.pexels.com/photos/3700513/pexels-photo-3700513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"

    if params[:query] == nil || params[:query] == ""
      @game_sessions = GameSession.all
    else
      @game_sessions = GameSession.search_by_city_and_date(params[:query])
    end
  end

  def show
  end

  def edit
  end

  def update
    @game_session.player_id = current_user.id
    if @game_session.update(game_session_params)
      redirect_to player_game_sessions_path
    else
      render :edit
    end
  end

  private

  def game_session_params
    params.require(:game_session).permit(:booked, :player)
  end

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  def search()
    @game_sessions = PgSearch.multisearch('superman')
  end
end






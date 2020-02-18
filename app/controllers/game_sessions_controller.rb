class GameSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_game_session, only: [:show, :edit, :update]

  def index
    if params[:query] == nil || params[:query] == ""
      @game_sessions = GameSession.all
    else
      @game_sessions = GameSession.search_by_city_and_date(params[:query])
    end
    @image_placeholder = "https://avatarfiles.alphacoders.com/164/164836.jpg"
  end

  def show
  end

  def edit
  end

  def update
    player_id = current_user.id
    if @game_session.update(player_id)
      redirect_to player_game_sessions_path
    else
      render :edit
    end
    #ajout de render à prévoir
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






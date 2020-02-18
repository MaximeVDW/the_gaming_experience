class GameSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_game_session, only: [:show, :edit, :update]

  def index
<<<<<<< Updated upstream
    @game_sessions = GameSession.all
    @image_placeholder = "https://avatarfiles.alphacoders.com/164/164836.jpg"
=======
    @image_placeholder = "https://images.pexels.com/photos/3700513/pexels-photo-3700513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
    if params[:query] == nil || params[:query] == ""
      @game_sessions = GameSession.all
    else
      @game_sessions = GameSession.search_by_city_and_date(params[:query])
    end
>>>>>>> Stashed changes
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






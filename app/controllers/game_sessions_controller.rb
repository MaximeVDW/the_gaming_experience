require 'date'

class GameSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_game_session, only: [:show, :edit, :update]

  def index

    @image_placeholder = "https://images.pexels.com/photos/3700513/pexels-photo-3700513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"

    @game_sessions = GameSession.all.sort_by {|game_session| game_session.date}

    if params[:query].present?
    @game_sessions = GameSession.all.search_by_city(params[:query]).sort_by {|game_session| game_session.date}
    end

    @geocoded_sessions = @game_sessions.select {|session| session.geocoded?}
    @markers = @geocoded_sessions.map do |session|
      {
        lat: session.latitude,
        lng: session.longitude
      }
    end

    # c´est pour classifier les cartes dans index
    @today = Date.today
    @next_sunday = next_sunday(@today)
    @today_use = true
    @this_week_use = true
    @this_month_use = true
    @later_this_year_use = true
    @next_year_use = true
  end

  def show
    @image_placeholder = "https://images.pexels.com/photos/3700513/pexels-photo-3700513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
  end

  def edit
    @users = User.all
  end

  def update
    @game_session.player_id = current_user.id
    if @game_session.update(game_session_params)
      redirect_to player_game_sessions_path
    else
      render :edit
    end
  end

  def destroy
    @game_session = GameSession.find(params[:id])
    @game_session.destroy
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

  def next_sunday(date)
    days_until_sunday = 7 - date.wday
    if days_until_sunday == 0 then
      return date + 7
    else
      return date + days_until_sunday
    end
  end

end






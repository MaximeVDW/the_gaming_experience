class Player::GameSessionsController < ApplicationController
  def index
    #@game_sessions = GameSession.where(player_id: current_user.id)
    #Si bug voir avec Geoffrey
    @game_sessions = GameSession.all
    @image_placeholder = "https://images.pexels.com/photos/3700513/pexels-photo-3700513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
    @game_sessions = @game_sessions.sort_by {|game_session| game_session.date}

    @today = Date.today
    @next_sunday = next_sunday(@today)
    @today_use = true
    @this_week_use = true
    @this_month_use = true
    @later_this_year_use = true
    @next_year_use = true
  end

  def edit
    @game_session = GameSession.find(params[:id])
    @user = current_user
  end

  def update
    @game_session = GameSession.find(params[:id])
    @user = current_user
    if params["booked"].present?
      @game_session["booked"] = false
      @game_session["player_id"] = nil
      @game_session.save
      redirect_to player_game_sessions_path
    elsif @user.update(params_edit_player)
      redirect_to edit_player_game_session_path(@user)
    else
      render :edit
    end
  end

  private

  def params_edit_player
    params.require(:game_session).permit(:first_name, :last_name, :username, :photo, :city)
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

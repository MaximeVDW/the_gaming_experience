class Player::GameSessionsController < ApplicationController
  def index
    #@game_sessions = GameSession.where(player_id: current_user.id)
    #Si bug voir avec Geoffrey
    @game_sessions = GameSession.all
    @image_placeholder = "https://images.pexels.com/photos/3700513/pexels-photo-3700513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
    @game_sessions = @game_sessions.sort_by {|game_session| game_session.date}
  end

  def edit
    @game_session = GameSession.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params_edit_player)
      redirect_to edit_player_game_session_path(@user)
    else
      render :edit
    end
  end

  private

  def params_edit_player
    params.require(:game_session).permit(:first_name, :last_name, :username, :photo, :city)
  end
end

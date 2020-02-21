class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @my_friends = []
    my_friends
    @game_sessions = GameSession.where(:creator_id => params[:id])
  end

  def edit
  end

  def update
    if params[:friend_list] != @user[:friend_list]
      @user.update({friend_list: params[:friend_list]})
      redirect_to user_path(current_user)
    else
      raise
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  end

   private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :phone_number, :street, :street_number, :postal_code, :city, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def my_friends
    friend_id_list = @user.friend_list.split(",")
    friend_id_list.each { |friend_id|
      @my_friends << User.find(friend_id.to_i)
    }
  end
end


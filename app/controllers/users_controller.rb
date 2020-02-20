class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @game_sessions = GameSession.where(:creator_id => params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :phone_number, :street, :street_number, :postal_code, :city, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end


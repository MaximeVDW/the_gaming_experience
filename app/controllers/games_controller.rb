class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @games = Game.all

    if params[:query] == nil || params[:query] == ""
      @games = Game.all
    else
      @games = Game.search_by_name_and_category(params[:query])
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params_game)
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(params_game)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private

  def params_game
    params.require(:game).permit(:name, :description, :photo, :min_player, :max_player, :category)
  end
end

class GamesController < ApplicationController
  def index
    @games = Game.all
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

  private

  def params_game
    params.require(:game).permit(:name, :description, :photo, :min_player, :max_player, :category)
  end
end

class GamesController < ApplicationController

  def index
      @game = Game.find_by(game_title_id: params[:game_title_id])
  end
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.game_title_id = params[:game_title_id]
    if @game.valid?
      @game.save
      redirect_to games_path(game_title_id: params[:game_title_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def game_params
    params.require(:game).permit(:game_title_id, :player_name, :rank, :clan, :playstyle, :image).merge(user_id: current_user.id)
  end


end

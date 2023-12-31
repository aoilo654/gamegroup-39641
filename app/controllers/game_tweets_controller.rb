class GameTweetsController < ApplicationController

  def index
    @game = Game.where(game_title_id: params[:game_title_id])
    set_mygame
    @game_tweets = GameTweet.find_by(game_title_id: params[:game_title_id])
    @game_tweet = GameTweet.new
  end

  def create
    @game_tweet = GameTweet.new(tweet_params)
    @game_tweet.game_title_id = params[:game_title_id]
    if @game_tweet.valid?
      @game_tweet.save
      redirect_to game_tweets_path(game_title_id: params[:game_title_id])
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def tweet_params
    params.require(:game_tweet).permit(:game_title_id, :tweet).merge(user_id: current_user.id)
  end

  def set_mygame
    if user_signed_in?
      @mygame = @game.find_by(user_id: current_user.id)
    end
  end
end

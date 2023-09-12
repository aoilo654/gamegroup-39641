class GameTweetsController < ApplicationController

  def index
    @game_tweets = GameTweet.find_by(game_title_id: params[:game_title_id])
    @game_tweet = GameTweet.new(tweet_params)
  end

  def create
    @game_tweet = GameTweet.new(tweet_params)
    @game_tweet.game_title_id = params[:game_title_id]
  end

  private
  def tweet_params
    params.require(:game_tweet).permit(:game_title_id, :tweet).merge(user_id: current_user.id)
  end
end

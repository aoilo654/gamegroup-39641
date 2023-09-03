class GameTweetsController < ApplicationController

  def index
    @game_tweets = GameTweet.find_by(game_title_id: params[:game_title_id])
  end

end

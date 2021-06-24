class TweetsController < ApplicationController
  before_action :require_logged_in!

  def index
    @tweets = Current.user.tweets
  end
end
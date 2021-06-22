class OmniauthCallbacks < ApplicationController
  def twitter
    Current.user.twitter_accounts.create(
        
    )
  end
end

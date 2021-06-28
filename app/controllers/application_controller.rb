class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      # we used Find_by so if we have to destroy a user the rails app dosn't trow an error
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_logged_in!
    redirect_to sign_in_path, alert: 'You must be logged in!' if Current.user.nil?
  end
end

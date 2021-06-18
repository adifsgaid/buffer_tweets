class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      
    end
    redirect_to root_pat, notice: 'An email has been sent, click the link to reset your password.'
  end
end

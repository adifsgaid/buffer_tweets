class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    PasswordMailer.with(user: @user).reset.deliver_now if @user.present?

    redirect_to root_path, notice: 'An email has been sent, click the link to reset your password.'
  end
end

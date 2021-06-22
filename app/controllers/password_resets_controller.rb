class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    PasswordMailer.with(user: @user).reset.deliver_now if @user.present?

    redirect_to root_path, notice: 'An email has been sent, click the link to reset your password.'
  end

  def edit
    @user = User.find_signed(params[:token], purpose: 'Password_Reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired, please try again'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'Password_Reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your password is succesfully changed, Log in'
    else
      render :edit, alert: 'something went wrong, try again'
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

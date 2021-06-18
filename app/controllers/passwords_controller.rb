class PasswordsController < ApplicationController
    before_action :require_logged_in

    def edit
    end

    def update
        if Current.user.update(password_params)
             redirect_to root_path, notice: "Password Sucesfully Changed"
        else
            render :edit, alert: "Something Went Wrong"
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
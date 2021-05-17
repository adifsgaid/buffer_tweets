class MainController < ApplicationController
    def index
        if session[:user_id]
            # we used Find_by so if we have to destroy a user the rails app dosn't trow an error
            @user = User.find_by(id: session[:user_id])
        end
    end
end
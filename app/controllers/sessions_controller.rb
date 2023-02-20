class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        session[:session_token] = @user.reset_session_token!
        redirect_to cats_url
    end

    def destroy
        if current_user
            @user.reset_session_token!
            session[:session_token] = nil
            @user = nil
        else
            redirect_to cats_url
        end
    end
end

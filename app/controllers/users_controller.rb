class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new]

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect cats_url
        else
            redirect_to new_user_url
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
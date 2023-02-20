class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        password_digest
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
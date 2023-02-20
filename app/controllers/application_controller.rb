class ApplicationController < ActionController::Base
    helper_method :current_user
    

    def current_user
        @current_user = User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        session[:session_token] = @current_user.ensure_session_token
    end

    def logged_in?
        !!current_user
    end

    def require_logged_in
        redirect_to cats_url unless logged_in?
    end
end
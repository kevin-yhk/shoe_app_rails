module ApplicationHelper
    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end 

    def verification
        redirect_to '/' unless logged_in?
    end
end

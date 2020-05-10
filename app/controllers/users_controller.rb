class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid? 
            session[:user_id] = @user.id
            redirect_to user_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end 
end

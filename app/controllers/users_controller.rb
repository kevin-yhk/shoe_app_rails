class UsersController < ApplicationController
    before_action :logged_in?, :current_user
    
    def new 
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid? 
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end 
end

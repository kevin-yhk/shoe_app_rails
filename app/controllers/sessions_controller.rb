class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
      end

    def destroy
          session.delete :user_id
          redirect_to root_url
    end
end
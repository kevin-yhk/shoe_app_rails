class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to @user
        else
          render :new
        end
      end

      def facebook
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
          u.username = auth['info']['name']
          u.password = SecureRandom.hex
          end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end  

    def destroy
          session.delete :user_id
          redirect_to root_url
    end

    private
 
	def auth
	  request.env['omniauth.auth']
	end
end

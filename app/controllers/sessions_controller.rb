class SessionsController < ApplicationController
    def new
    end

    def create
        provided_username = params[:session][:username]
        provided_password = params[:session][:password]
        user = User.find_by(username: provided_username)
        if user and user.authenticate(provided_password)
            session[:user_id] = user.id
            flash[:positive] = "You have successfully logged in"
            redirect_to root_path
        else
            flash.now[:error] = "There is something wrong with your login information"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:positive] = "You have successfully logged out"
        redirect_to root_path
    end
end
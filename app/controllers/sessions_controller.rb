class SessionsController < ApplicationController
    before_action :logged_in_redirect, except: [:destroy]
    
    def new
    end

    def create
        provided_username = params[:session][:username]
        provided_password = params[:session][:password]
        user = User.find_by(username: provided_username)
        if user and user.authenticate(provided_password)
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to root_path
        else
            flash.now[:error] = "There is something wrong with your login information"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out"
        redirect_to root_path
    end

    private
        def logged_in_redirect
            if logged_in?
                flash[:error] = "You are already logged in"
                redirect_to root_path
            end
        end
end
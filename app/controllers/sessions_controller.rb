class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Welcome again #{user.username} you are cool!"
           redirect_to root_path 
        else
            flash.now[:danger] = "Sorry Folk wrong info try again"
            render :new
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You are Log'd out – Come Back Soon Bro!"
        redirect_to login_path
    end
end
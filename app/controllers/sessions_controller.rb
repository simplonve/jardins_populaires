class SessionsController < ApplicationController
	def new
	end
	def create
	  user = User.find_by(email: params[:login][:email]) 
	  if user && user.authenticate(params[:login][:password]) 
	    session[:user_id] = user.id 
	    flash[:notice] = "Vous êtes connectés"
	    redirect_to root_path
	  else
	    render :new 
	  end
	end
	def destroy
	  session[:user_id] = nil
	  flash[:notice] = "Logged out successfully."
	  redirect_to root_path
	end
end

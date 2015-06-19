class UsersController < ApplicationController
	def new
	 @user = User.new
	end
	def create
	  @user = User.create(user_params)
	  if @user.save
	    flash[:notice] = "Vous êtes suivis, attention"
	    session[:user_id] = @user.id
	    redirect_to root_path
	  else
	    render :new
	  end
	end

	private

	def user_params
	  params.require(:user).permit(:email, :password, :password_confirmation)
	end
end

class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(username: params[:username]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to new_session_path
		end
		
  end

  def destroy
  	session[:user_id] = nil
    redirect_to posts_path
  end
end

class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@post = Post.new
  end
  # this is a GET action
  # all it does is simply load a view page (template) with a blank form
  def edit
  	@user = current_user
  	# @user.update
  end
  # this is a POST/PUT/DELETE action
  # it actually does things in the background, like updating the database
  # after it is done you will need to redirect to a GET action in order to avoid (no template found error)
  def update
  	@user = current_user
  	@user.update(user_params)
		redirect_to user_path(@user)
  end
  # this is a POST/PUT/DELETE action
  # it actually does things in the background, like updating the database
  # after it is done you will need to redirect to a GET action in order to avoid (no template found error)
  def destroy
  	@user = current_user
		@user.destroy
		session.clear
		redirect_to posts_path
  end
  # this is a GET action
  # all it does is simply load a view page (template) with a blank form
  def new
  	@user = User.new
  end
  # this is a POST/PUT/DELETE action
  # it actually does things in the background, like updating the database
  # after it is done you will need to redirect to a GET action in order to avoid (no template found error)
  def create
  	@user = User.new(user_params)
  	@user.save
  	redirect_to posts_path
 	end

 	private

 	def user_params
 		params.require(:user).permit(:username, :password, :fname, :lname, :birthday, :email)
 	end
end

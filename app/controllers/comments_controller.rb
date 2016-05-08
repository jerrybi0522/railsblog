class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.save
		redirect_to post_path(@comment.post)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@post = @comment.post
		@comment.destroy
		redirect_to post_path(@post)
	end

	def comment_params
 		params.require(:comment).permit(:body, :post_id, :user_id)
 	end
end

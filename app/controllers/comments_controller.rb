class CommentsController < ApplicationController
	include Pundit

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to post_path(@post)
		else
			logger.error "Comment was not saved."
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		authorize @comment, :edit?
		@comment.destroy

		redirect_to post_path(@post)
	end
	
end

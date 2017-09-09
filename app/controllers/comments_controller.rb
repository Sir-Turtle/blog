class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		#@comment.user_id = current_user.id

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	private
		def is_current_user_owner(post)
			post.user_id == current_user.id
		end
	
end

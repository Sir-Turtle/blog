class PostsController < ApplicationController
	include Pundit
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
		authorize @post, :edit?
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		authorize @post, :edit?
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def publish
		@post = Post.find(params[:id])

		authorize @post, :edit?
		@post.published = true

		if @post.save
			logger.info "Post is successfully saved after publish"
			redirect_to @post
		else
			#display error message
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])

		authorize @post
		render 'edit'
	end

	def update
		@post = Post.find(params[:id])

		authorize @post, :edit?
		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])

		authorize @post, :edit?
		@post.destroy
		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end


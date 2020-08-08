class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_post, only:[:show, :destory]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
		else
			render "posts/new"
		end
	end

	def show
	end

	def index
		@posts = Post.all
	end

	def destroy
	end

	private

	def get_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(
			:title,
			:body,
			:image,
			:video
		)
	end
end

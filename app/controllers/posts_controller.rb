class PostsController < ApplicationController
	before_action :authenticate_user!, only:[:new, :create, :show, :destroy]
	before_action :get_post, only:[:show, :destroy]

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
		@post_comment = PostComment.new
		@post_comments = PostComment.where(post_id: @post.id)
	end

	def index
		@posts = Post.page(params[:page]).reverse_order
	end

	def destroy
		@post.destroy
		redirect_to request.referrer
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
			:video,
			:tag_id
		)
	end
end

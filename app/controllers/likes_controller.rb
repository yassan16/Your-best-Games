class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		like = Like.new
		like.user_id = current_user.id
		like.post_id = post.id
		like.save
		redirect_to request.referrer
	end

	def destroy
		post = Post.find(params[:post_id])
		like = current_user.likes.find_by(post_id: post.id)
		like.destroy
		redirect_to request.referrer
	end
end

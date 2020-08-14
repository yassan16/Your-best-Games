class PostCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		comment = PostComment.new(post_comment_params)
		comment.user_id = current_user.id
		comment.post_id = post.id

		if comment.save
			redirect_to request.referrer
		else
			redirect_to request.referrer
		end
	end

	def destroy
		comment = PostComment.find(params[:id])

		if comment.user_id == current_user.id
			comment.destroy
			redirect_to request.referrer
		else
			redirect_to request.referrer
		end
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end

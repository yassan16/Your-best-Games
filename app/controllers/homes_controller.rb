class HomesController < ApplicationController
	def top
		@post_rank = Post.find(
			Like.group(:post_id).order('count(post_id) desc')
			.limit(3).pluck(:post_id)
		)
		@posts = Post.all
	end

	def about
	end

	def search
		search = params[:search]

		@posts = Post.where("title LIKE? OR body LIKE?", "%#{search}%", "%#{search}%" )
						.page(params[:page])
	end
end

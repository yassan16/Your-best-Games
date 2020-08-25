class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :get_user, only:[:show, :edit, :update, :destroy]

	def show
		@posts = Post.where(user_id: @user.id).reverse_order.page(params[:page])
	end

	def index
		@users = User.where(is_active: true).page(params[:page]).per(12)
	end

	def edit
	end

	def update
		if	@user.update(user_params)
			redirect_to user_path(current_user)
		else
			render ("users/edit")
		end
	end

	def destroy
		@user.destroy
		redirect_to root_path
	end

	private

	def get_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(
			:nickname,
			:profile_image,
			:email,
			:is_active
		)
	end
end

class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	before_action :get_user, only:[:edit, :update]

	def top
	end

	def index
		@users = User.all
	end

	def edit
	end

	def update
		if @user.update(admin_user_params)
			redirect_to admins_users_path
		else
			render ("admins/users/edit")
		end
	end

	protected

	def get_user
		@user = User.find(params[:id])
	end

	def admin_user_params
		params.require(:user).permit(
			:nickname,
			:profile_image,
			:email,
			:is_active
		)
	end
end

class Admins::TagsController < ApplicationController
	before_action :authenticate_admin!
	before_action :get_tag, only:[:edit, :update, :destroy]

	def index
		@tag = Tag.new
		@tags = Tag.all
	end

	def create
		@tag = Tag.new(tag_params)
		@tag.save
		redirect_to admins_tags_path
	end

	def edit
	end

	def update
		if @tag.update(tag_params)
			redirect_to admins_tags_path
		else
			render 'edit'
		end
	end

	def destroy
		@tag.destroy
		redirect_to admins_tags_path
	end

	private

	def get_tag
		@tag = Tag.find(params[:id])
	end

	def tag_params
		params.require(:tag).permit(:tag_name)
	end
end

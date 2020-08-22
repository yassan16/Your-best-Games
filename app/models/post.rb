class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	mount_uploader :video, VideoUploader

	belongs_to :user

	has_many :post_comments

	has_many :likes, dependent: :destroy

	belongs_to :tag

	with_options presence: true do
	  validates :title
	  validates :body
	  validates :image
	end

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

end

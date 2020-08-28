class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	mount_uploader :video, VideoUploader

	belongs_to :user
	has_many :post_comments
	has_many :likes, dependent: :destroy
	belongs_to :tag
	has_many :notifications, dependent: :destroy

	with_options presence: true do
	  validates :title, length: { in: 1..30 }
	  validates :body, length: { in: 1..140 }
	  validates :image
	end

	def liked_by?(user)
    likes.where(user_id: user.id).exists?
	end

	def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      post_id: id,
      visited_id: user_id,
      action: "like"
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, post_comment_id)
    temp_ids = PostComment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct

    temp_ids.each do |temp_id|
        save_notification_comment!(current_user, post_comment_id, temp_id['user_id'])
    end

    save_notification_comment!(current_user, post_comment_id, user_id) if temp_ids.blank?
	end

  def save_notification_comment!(current_user, post_comment_id, visited_id)
    notification = current_user.active_notifications.new(
			post_id: id,
			post_comment_id: post_comment_id,
			visited_id: visited_id,
			action: 'comment'
    )

    if notification.visiter_id == notification.visited_id
    	notification.checked = true
    end

    notification.save if notification.valid?
   end
end

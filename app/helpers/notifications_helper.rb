module NotificationsHelper
	def notification_form(notification)
		@visiter = notification.visiter
		@post_comment = nil
		@visiter_comment = notification.post_comment_id

		case notification.action
			when "like" then
				tag.a(notification.visiter.nickname, href:user_path(@visiter)) + "が" +
					tag.a("あなたの投稿", href:post_path(notification.post_id))+"にいいねしました"

			when "comment" then
			    @post_comment = PostComment.find_by(id: @visiter_comment)
			    @post_comment_comment = @post_comment.comment
			    tag.a(notification.visiter.nickname, href:user_path(@visiter)) + "が" +
			    	tag.a("あなたの投稿", href:post_path(notification.post_id))+"にコメントしました"
		end

    end

    def unchecked_notifications
    	if user_signed_in?
    		@notifications = current_user.passive_notifications.where(checked: false)
    							.where.not(visiter_id: current_user.id)
    	end
	end
end

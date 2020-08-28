class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable

	mount_uploader :profile_image, ProfileImageUploader

	has_many :posts, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :active_notifications, class_name: "Notification",
				foreign_key: "visiter_id", dependent: :destroy
	has_many :passive_notifications, class_name: "Notification",
				foreign_key: "visited_id", dependent: :destroy

	enum is_active: {Available: true, Invalid: false}

	with_options presence: true do
	  validates :email
	  validates :nickname, length: { in: 1..20 }
	end

	def active_for_authentication?
		super && (self.is_active === "Available")
	end

end
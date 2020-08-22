class Tag < ApplicationRecord
	has_many :posts

	validates :tag_name, presence: true

end

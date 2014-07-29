class Comment < ActiveRecord::Base
	belongs_to :entry
	belongs_to :user
	validates :user_id, presence: true
  	validates :comment_content, presence: true , length: { maximum: 140 }
  	validates :entry_id, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :commentable, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :users

  validates :commentable, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end

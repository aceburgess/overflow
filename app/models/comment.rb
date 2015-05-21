class Comment < ActiveRecord::Base
  belongs_to :questions, as: :commentable
  belongs_to :answers, as: :commentable
  belongs_to :users

  validates :commentable, presence: true
  validates :content, presence: true
  validate :user_id, presence: true
end

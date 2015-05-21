class Vote < ActiveRecord::Base
  belongs_to :questions, as: :votable
  belongs_to :answers, as: :votable
  belongs_to :users

  validates :votable, presence: true
  validates :is_upvote, presence: true
  validate :user_id, presence: true
end

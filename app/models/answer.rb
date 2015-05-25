class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :comments, as: :commentable
	has_many :votes, as: :votable

	validates :user_id, presence: true
	validates :question_id, presence: true
	validates :content, presence: true

  def total_votes
    votes.where(is_upvote: true).count - votes.where(is_upvote: false).count
  end
end

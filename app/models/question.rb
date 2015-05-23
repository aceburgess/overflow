class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questionTags
  has_many :tags, through: :questionTags
  has_many :answers
  belongs_to :user
  has_one :chosen_answer, class_name: :answer

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  def total_votes
    votes.where(is_upvote: true).count - votes.where(is_upvote: false).count
  end
end
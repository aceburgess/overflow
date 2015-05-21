class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :comments, as: :commentable
	has_many :votes, as: :votable

	validates :user, presence: true
	validates :question, presence: true
	validates :content, presence: true
end

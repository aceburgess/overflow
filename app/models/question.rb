class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  belongs_to :user
  has_one :chosen_answer, class_name: :answer

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :is_answered, presence: true
end
class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_one :chosen_answer, source: :answer

  validates :title, presence: true
  validates :content, presnece: true
  validates :user_id, presence: true
  validates :is_answered, presence: true
end
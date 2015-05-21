class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_one :chosen_answer, source: :answer
end
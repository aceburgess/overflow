class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  def average_question_score
    score_array = questions.map { |q| q.total_votes }
    average = score_array.reduce(:+).to_f / score_array.size
    average.nan? ? 0 : average
  end

  def average_answer_score
    score_array = answers.map { |a| a.total_votes }
    average = score_array.reduce(:+).to_f / score_array.size
    average.nan? ? 0 : average
  end
end



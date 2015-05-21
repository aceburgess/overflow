class Comment < ActiveRecord::Base
  belongs_to :questions, as: :commentable
  belongs_to :answers, as: :commentable
  belongs_to :users
end

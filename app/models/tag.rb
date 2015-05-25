class Tag < ActiveRecord::Base
  has_many :questionTags
	has_many :questions, through: :questionTags

	validates :name, presence: true
end

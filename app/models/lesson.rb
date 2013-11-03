class Lesson < ActiveRecord::Base
	has_many :concept

	def new
	end
end

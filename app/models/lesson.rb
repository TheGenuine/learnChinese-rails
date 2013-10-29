class Lesson < ActiveRecord::Base
	has_many :lesson

	def new
		@title = ""
		@description = ""
		@lessons = Array.new
		@tags = Array.new
	end
end

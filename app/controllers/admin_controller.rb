class AdminController < ApplicationController
  def index
    @title = "Admin"
  end

  def lessons
    @title = "Admin-Lessons"
    @lessons = Lesson.all
    @lesson = Lesson.new
  end

  def words
    @title = "Admin-Words"
    @words = Word.all
  end

  def concepts
    @title = "Admin-Concepts"
    @concept = Concept.new
  	@concepts = Concept.all
  end
end

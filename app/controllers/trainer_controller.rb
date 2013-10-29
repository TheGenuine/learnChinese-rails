class TrainerController < ApplicationController
  
  def index
  	@title = "Trainers"
  end

  def number
  	@title = "Number Trainer"
  end

  def direction
  	@title = "Directions Trainer"
  end

  def color
  	@title = "Color Trainer"
  end
end

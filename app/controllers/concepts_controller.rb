class ConceptsController < ApplicationController

	def create
		@concept = Concept.new(params[:concept].permit(:sentence, :translation, :tags))

		@concept.save
		redirect_to :admin_concepts
	end

	def edit
		@concept = Concept.find(params[:id])

	end

	def destroy
		@concept = Concept.find(params[:id])
		@concept.destroy
		
		redirect_to :admin_concepts
	end
end

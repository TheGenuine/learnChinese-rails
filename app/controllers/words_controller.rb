class WordsController < ApplicationController
	def create
		@word = Word.new(params[:word].permit(:pinyn, :translation, :character, :types))

		@word.save
		redirect_to :admin_words
	end

	def edit

	end

	def destroy
		@word = Word.find(params[:id])
		@word.destroy
		
		redirect_to :admin_words
	end
end

class Word < ActiveRecord::Base
	has_many :types

	private
		def post_params
			params.require(:word).permit(:translation, :pinyn, :character, :types)
		end
end

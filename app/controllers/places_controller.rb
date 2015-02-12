class PlacesController < ApplicationController

	def index
		@places = Place.search
	end

end

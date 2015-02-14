class PlacesController < ApplicationController

	def index
		@places = Place.search
	end

##How do I do this?
	def show
		@place = Place.search[7]
	end

#How do i do this one?

	def new 
		@place = Place.new
	end










	def create
	end

	def edit
	end

	def update
	end

	def destoy
	end

end

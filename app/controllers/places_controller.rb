class PlacesController < ApplicationController

	def index
		@places = Place.search(params[:search])
	end

##How do I do this?
	def show
		 @my_places = current_user.places
	end

#How do i do this one?

	def new 
		# @places = Place.search
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end

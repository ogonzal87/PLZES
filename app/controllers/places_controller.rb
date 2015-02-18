class PlacesController < ApplicationController
before_action :signed_in_user

	def index
		@places = Place.search(params[:search])
	end

	def show
		 @my_places = current_user.places
	end

	def new 
		@place = Place.new
	end

	def create
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "Your place has been added!"
      redirect_to myplaces_path(current_user)
    else
      render 'index'
  	end
	end

	def edit
		#redirect_to myplaces_path
	end

	def destroy
		#redirect_to myplaces_path
	end

private

		def place_params
    	params.require(:place).permit(:name)
  	end
end
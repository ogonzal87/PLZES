class PlacesController < ApplicationController
  before_action :signed_in_user

	def index
		@places = Place.all
	end

	def show
    @place = Place.find(params[:id])
	end

  def results
    @places = Place.search(params[:search])
  end

	def new 
		@place = Place.new
	end

  def create
    @active = 'places'
    @place = current_user.places.new(place_params)
    if @place.save
      flash[:success] = "This place has been added to your Favorites!"
      redirect_to places_path
    else
      render 'new'
    end
  end

  def destroy
  	@place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
	end
	
	private

		def place_params
    	params.require(:place).permit(:name)
  	end
end
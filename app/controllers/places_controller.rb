class PlacesController < ApplicationController
  before_action :signed_in_user

	def index
		@places = Place.all
    @my_places = current_user.places
	end

	def show
    @place = Place.find(params[:id])
	end

  def results
    @places = Place.search(params[:category], params[:location])
  end

	def new
	   @place = Place.new
     @user = current_user
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
    params.require(:place).permit(:name, :rating, :photo)
  end

end

class DemographiesController < ApplicationController
  require 'google-places'
  before_action :set_place, only: [:show, :edit, :update]

  def index
    @places = Place.all
  end

  def nearbies
    @client = GooglePlaces::Client.new(ENV["PLACES_API_KEY"])
    @search = current_user.searches.last
    @ads = Ad.near([@search.latitude, @search.longitude], 10)
    @places = @client.spots(@ads)
  end

  def show
  end

  def edit
  end

  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title, :address, :latitude, :longitude)
  end
end

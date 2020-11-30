class DemographiesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!

  def index
    @places = Place.all
  end

  def chiffres_cles
    @client = GooglePlaces::Client.new(ENV["PLACES_API_KEY"])
    @search = current_user.searches.last
    @places = @client.spots(@search.latitude, @search.longitude, :types => 'kinésithérapeute', :radius => 10)
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
end

class SearchesController < ApplicationController
  skip_before_action  :authenticate_user!, only: [:create, :show, :questionnaire]

  def create
    if current_user
      @search = Search.new(query: params[:query], user: current_user)
      @search.save
    else
      cookies[:search] = params[:query]
      cookies[:searchjob] = params[:job]
    end
      redirect_to searches_path(@search&.id)
  end

  def show
    if current_user
      @search = Search.find(params[:id])
      @ads = Ad.near([@search.latitude, @search.longitude], 10)

      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)

    else
      coordinates = Geocoder.search(cookies[:search]).first.coordinates
      @ads = Ad.near([coordinates[0], coordinates[1]], 10)
    end

    @query = @search&.query || cookies[:search]

    @markers = @ads.map do |ad|
      {
        lat: ad.latitude,
        lng: ad.longitude,
        infoWindow: render_to_string(partial: "/shared/info_window", locals: { ad: ad }),
        # image_url: helpers.asset_url("image"),
        id: ad.id
      }
    end
  end

  def questionnaire
    cookies[:retraite] = params[:retraite]
  end

  def questionnaire2
  end
end



class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @search = Search.new
  end

  def insights
    @user = current_user
    @search = Search.find(params[:id])
    @ads = Ad.near([@search.latitude, @search.longitude], 10)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @ads.map do |ad|
      {
        lat: ad.latitude,
        lng: ad.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { ad: ad }),
        # image_url: helpers.asset_url("image"),
        id: ad.id
      }
    end
  end
end

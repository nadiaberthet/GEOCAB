class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @search = Search.new
  end

  def insights
    @search = Search.find(params[:id])

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = [{
        lat: @search.latitude,
        lng: @search.longitude
      }]
  end
end

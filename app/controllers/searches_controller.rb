class SearchesController < ApplicationController
  def create
    @search = Search.new(params[:search])
    if !search.nil?
      @searches = Unicorn.near(search[:query], 10)
      @ad_start = search[:startdate]
      @ad_end = search[:enddate]
    else
      @ads = AD.all
    end
    @markers = @ads.map do |ad|
      {
        lat: ad.latitude,
        lng: ad.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { ad: ad }),
        image_url: helpers.asset_url('image'),
        id: ad.id
      }
    end
  end
end

class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(user_params)
  end

  def dashboard
    @search = Search.find(params[:id])
    @ads = Ad.near([@search.latitude, @search.longitude], 10)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
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

  def mes_locaux
    @search = Search.find(params[:id])
    @ads = Ad.near([@search.latitude, @search.longitude], 10)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
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

  def chiffres_cles
  end

  private

  def user_params
    params.require(:user).permit(:job, :ordre, :cpam, :urssaf, :retraite, :assurance_rcp, :budget, :commodite) #doesn't work needs something else
  end
end

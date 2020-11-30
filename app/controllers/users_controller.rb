class UsersController < ApplicationController
  before_action :current, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.budget == nil
      @user.update(user_params)
      redirect_to questionnaire2_searches_path

    elsif current_user.budget == 0
      @user.update(user_params)
      redirect_to questionnaire2_searches_path

    else
      @user.update(user_params)
      redirect_to todo_lists_path
    end
  end

  def todo_update
    redirect_to dashboard_path
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
    @ad = Ad.all
    @avg = @ad.map(&:rent_cents).sum / @ad.length.to_f
    @client = GooglePlaces::Client.new(ENV["PLACES_API_KEY"])
    @search = current_user.searches.last
    @places = @client.spots(@search.latitude, @search.longitude, :name => 'Kinésithérapeute', :radius => 15000)
  end

  private

  def current
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:job, :ordre, :cpam, :urssaf, :retraite, :assurance_rcp, :budget, :commodite)
  end
end

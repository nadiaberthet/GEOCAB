class SearchesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user!, only: [:dashboard]

  def create
    job = current_user&.job || params[:job]
    @search = Search.create!(query: params[:query], job: job, user: current_user)
    cookies[:search_id] = @search.id unless current_user
    @places = search_places
    @places.each do |place|
      longitude = place.lng
      latitude = place.lat

      Competitor.find_or_create_by(
        latitude: latitude,
        longitude: longitude
      )
    end
    redirect_to search_path(@search.id)
  end

  def search_places
    client = GooglePlaces::Client.new(ENV["PLACES_API_KEY"])
    places = client.spots(@search.latitude, @search.longitude, name: 'Kinésithérapeute', radius: 15_000, multipage: true)
    return places
  end

  def show
    @search = Search.find(params[:id])
    @ads = Ad.near(@search, 10)

    @markers = @ads.map do |ad|
      {
        lat: ad.latitude,
        lng: ad.longitude,
        infoWindow: render_to_string(partial: "/shared/info_window", locals: { ad: ad }),
        image_url: helpers.asset_url("marker.png"),
        id: ad.id
      }
    end
  end

  def loading
  end

  def questionnaire_step_1
  end

  def questionnaire_step_2
  end

  def questionnaire_step_1_submit
    if current_user
      current_user.cpam = params[:cpam] == 'true'
      current_user.ordre = params[:ordre] == 'true'
      current_user.urssaf = params[:urssaf] == 'true'
      current_user.assurance_rcp = params[:assurance_rcp] == 'true'
      current_user.retraite = params[:retraite] == 'true'
      current_user.save
    else
      cookies[:cpam] = params[:cpam]
      cookies[:ordre] = params[:ordre]
      cookies[:urssaf] = params[:urssaf]
      cookies[:assurance_rcp] = params[:assurance_rcp]
      cookies[:retraite] = params[:retraite]
    end
    redirect_to questionnaire_step_2_searches_path
  end

  def questionnaire_step_2_submit
    if current_user
      current_user.budget = params[:budget]
      current_user.save
    else
      cookies[:budget] = params[:budget]
    end
    redirect_to dashboard_path
  end

  def dashboard
    redirect_to root_path if current_user && current_user.searches.none?
    @search = current_user ? current_user.searches.last : Search.find(cookies[:search_id])
    @options = {
      cpam: current_user ? current_user.cpam : cookies[:cpam],
      ordre: current_user ? current_user.ordre : cookies[:ordre],
      urssaf: current_user ? current_user.urssaf : cookies[:urssaf],
      retraite: current_user ? current_user.retraite : cookies[:retraite],
      assurance_rcp: current_user ? current_user.assurance_rcp : cookies[:assurance_rcp],
      budget: current_user ? current_user.budget : cookies[:budget],
      location: @search.query,
      jobs: @search.job
    }
    @ads = Ad.near(@search, 10)

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
end

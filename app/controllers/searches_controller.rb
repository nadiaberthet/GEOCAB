class SearchesController < ApplicationController
  skip_before_action  :authenticate_user!

  def create
    job = current_user&.job || params[:job]
    @search = Search.create!(query: params[:query], job: job, user: current_user)
    cookies[:search_id] = @search.id unless current_user
    redirect_to search_path(@search.id)
  end

  def show
    @search = Search.find(params[:id])
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

  def questionnaire_step_1
    cookies[:retraite] = params[:retraite]
  end

  def questionnaire_step_2
  end

  def questionnaire_step_1_submit
    if current_user
      current_user.cpam = params[:cpam] == 'true'
      current_user.save
    else
      cookies[:cpam] = params[:cpam]
    end
    redirect_to dashboard_path
  end


  def dashboard
    raise "no search, you need to redirect to new search path here (redirect to ...)" if current_user && current_user.searches.none?
    @search = current_user ? current_user.searches.last : Search.find(cookies[:search_id])
    @options = {
      cpam: current_user ? current_user.cpam : cookies[:cpam],
      location: @search.query,
      josb: @search.job
      #don't forget to put all radiobuttons here
    }
  end
end



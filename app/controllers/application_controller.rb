class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if cookies[:search_id]
      search = Search.find(cookies[:search_id])
      search.update(user: resource)
      resource.cpam = cookies[:cpam] == 'true'
      resource.ordre = cookies[:ordre] == 'true'
      resource.urssaf = cookies[:urssaf] == 'true'
      resource.assurance_rcp = cookies[:assurance_rcp] == 'true'
      resource.retraite = cookies[:retraite] == 'true'
      resource.budget = cookies[:budget]
      resource.job = search.job
      resource.save
      cookies.delete :search_id
    end
    stored_location_for(resource) || loading_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end

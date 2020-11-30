class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if cookies[:search_id]
      search = Search.find(cookies[:search_id])
      search.update(user: resource)
      resource.cpam = cookies[:cpam] == 'true'
      resource.save
      cookies.delete :search_id
    end
    stored_location_for(resource) || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

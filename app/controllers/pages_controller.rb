class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :insights,:questionnaire]

  def home
  end

end

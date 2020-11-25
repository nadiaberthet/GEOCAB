class SearchesController < ApplicationController
  def create
    @search = Search.new(query: params[:search][:query], user: current_user)
    @search.save!
    redirect_to insights_path
  end

end


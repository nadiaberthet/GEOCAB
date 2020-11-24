class SearchesController < ApplicationController
  def create
    @searche = Search.new(params[])
  end
end

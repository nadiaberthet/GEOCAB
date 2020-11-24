class SearchesController < ApplicationController
  def create
    @search = Search.new(params[])
  end
end

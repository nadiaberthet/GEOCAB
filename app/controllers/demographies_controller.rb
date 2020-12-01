class DemographiesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!
end

class LocationsController < ApplicationController

  def index
    where = params[:where]


    locations = Location.where(where || {})
    render :json => locations
  end
end

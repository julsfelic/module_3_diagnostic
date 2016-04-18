class SearchController < ApplicationController
  def index
    @stations = Station.find_by(params[:q])
  end
end

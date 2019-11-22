class TopographicMapController < ApplicationController
  before_action :set_gpx, only: [:index, :new, :create]
  before_action :set_elevation, only: [:show, :edit, :update, :destroy]

  def new
    @topographic_map = @gpx.topographic_map.build
  end

  def index
    @topographic_map = @gpx.topographic_map
  end

  def create
    @topographic_map = @gpx.topographic_map.build(topographic_params)

    respond_to do |format|
      if @topographic_map.save
        format.html { redirect_to @topographic_map }
      else
        flash.now[:alert] = "Could not create new topographic map. Please check input."
        format.html { render :new }
      end
    end
  end
end

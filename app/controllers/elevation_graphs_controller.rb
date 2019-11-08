class ElevationGraphsController < ApplicationController
  before_action :set_gpx, only: [:index, :new, :create]
  before_action :set_elevation, only: [:show, :edit, :update, :destroy]

  def new
    @elevationgraph = @gpx.elevationgraph.build
  end

  def index
    @elevationgraphs = @gpx.elevationgraph
  end

  def create
    @elevation = @gpx.elevationgraph.build(elevation_params)

    respond_to do |format|
      if @elevationgraph.save
        # Inheriting the attachment of its parent object
        @elevationgraph.data.attach(@gpx.file.blob)
        format.html { redirect_to @elevationgraph }
      else
        flash.now[:alert] = "Could not create new elevation profile. Please check input."
        format.html { render :new }
      end
    end
end

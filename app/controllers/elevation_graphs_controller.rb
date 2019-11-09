class ElevationGraphsController < ApplicationController
  before_action :set_gpx, only: [:index, :new, :create]
  before_action :set_elevation, only: [:show, :edit, :update, :destroy]

  def new
    @elevationgraph = @gpx.elevation_graph.build
  end

  def index
    @elevationgraphs = @gpx.elevation_graph
  end

  def create
    @elevationgraph = @gpx.elevation_graph.build(elevation_params)

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

  def show
    Daru::View.plotting_library = :highcharts
    @data = @elevationgraph.parse
    @opts = @elevationgraph.options
  end

  def edit
  end

  def update
    respond_to do |format|
      if @elevationgraph.update(elevation_params)
        format.html { redirect_to @elevationgraph }
      else
        flash.now[:alert] = "Could not create elevation profile. Please check input."
        format.html { render :edit }
      end
    end
  end

  def destroy
    @elevationgraph.destroy
    redirect_to gpx_elevationgraphs_path(@elevationgraph.gpx_id), notice: "Your elevation profile has been successfully deleted."
  end


  private
    def elevation_params
      params.require(:elevationgraph).permit(:chart_title, :x_title, :y_title, :gpx_id, :size, :data)
    end

    def set_gpx
      @gpx = Gpx.find(params[:gpx_id])
    end

    def set_elevation
      @elevationgraph = ElevationGraph.find(params[:id])
    end
end

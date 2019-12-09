class ElevationGraphsController < ApplicationController
  before_action :set_gpx, only: [:index, :new, :create]
  before_action :set_elevation, only: [:show, :edit, :update, :destroy]

  def new
    @elevation_graph = @gpx.elevation_graph.build
  end

  def index
    @elevation_graphs = @gpx.elevation_graph
  end

  def create
    @elevation_graph = @gpx.elevation_graph.build(elevation_params)

    respond_to do |format|
      if @elevation_graph.save
        format.html { redirect_to @elevation_graph }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @data = @elevation_graph.zip
  end

  def edit
  end

  def update
    respond_to do |format|
      if @elevation_graph.update(elevation_params)
        format.html { redirect_to @elevation_graph }
      else
        flash.now[:alert] = "Could not create elevation profile. Please check input."
        format.html { render :edit }
      end
    end
  end

  def destroy
    @elevation_graph.destroy
    redirect_to gpx_elevation_graphs_path(@elevation_graph.gpx_id), notice: "Your elevation profile has been successfully deleted."
  end


  private
    def elevation_params
      params.require(:elevation_graph).permit(:chart_title, :x_title, :y_title, :gpx_id, :size, :units)
    end

    def set_gpx
      @gpx = Gpx.find(params[:gpx_id])
    end

    def set_elevation
      @elevation_graph = ElevationGraph.find(params[:id])
    end
end

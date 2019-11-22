class TopographicMapController < ApplicationController
  before_action :set_gpx, only: [:index, :new, :create]
  before_action :set_elevation, only: [:show, :edit, :update, :destroy]

  def new
    @topographic_map = @gpx.topographic_map.build
  end

  def index
    @topographic_maps = @gpx.topographic_map
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

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @topographic_map.update(topographic_params)
        format.html { redirect_to @topographic_map }
      else
        flash.now[:alert] = "Could not create topographic map. Please check input."
        format.html { render :edit }
      end
    end
  end

  def destroy
    @topographic_map.destroy
    redirect_to gpx_topographic_maps_path(@topographic_map.gpx_id), notice: "Your topographic map has been successfully deleted."
  end

  private
    def topographic_params
      params.require(:topographic_map).permit(:chart_title, :gpx_id, :size, :data)
    end

    def set_gpx
      @gpx = Gpx.find(params[:gpx_id])
    end

    def set_topographic
      @topographic_map = TopographicMap.find(params[:id])
    end
end

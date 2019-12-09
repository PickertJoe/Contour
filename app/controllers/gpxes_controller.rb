class GpxesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit]
  before_action :set_gpx, only: [:show, :edit, :update, :destroy]

  def index
    @gpxes = current_user.gpxes
  end

  def new
    @gpx = current_user.gpxes.build
    @path = [current_user, @gpx]
  end

  def edit
    @path = @gpx
  end

  def create
    @gpx = current_user.gpxes.build(gpx_params)

    respond_to do |format|
      if @gpx.save
        format.html {redirect_to user_gpxes_path(current_user), notice: "Gpx file was successfully uploaded"}
      else
        format.html {render :new}
      end
    end
  end

  def update
    @gpx.update(gpx_params)

    respond_to do |format|
      if @gpx.save
        format.html {redirect_to user_gpxes_path(current_user), notice: "Gpx file was successfully updated"}
        # Placeholder for future JSON response
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @gpx.destroy
    redirect_to user_gpxes_path(current_user), notice: "Your GPX file has been successfully deleted"
  end

  private
    def set_user
      @user = current_user
    end

    def set_gpx
      @gpx = Gpx.find(params[:id])
    end

    def gpx_params
      params.require(:gpx).permit(:name, :activity, :file, :user_id)
    end

end


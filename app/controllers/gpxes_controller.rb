class GpxesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before action :set_gpx, only: [:show, :edit, :update, :destroy]

  def index
    @gpxes = @user.gpx
  end

  def new
    @gpx = @user.gpx.build
  end

  def edit
  end

  def create
    @gpx = @user.gpx.build(gpx_params)

    respond_to do |format|
      if @gpx.save
        format.html {redirect_to user_gpxes_path(current_user), notice: "Gpx file was successfully uploaded"}
        # How to provide a JSON response?
      else
        format.html {render :new}
        # Placeholder for future JSON response
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

  def destroy
    @gpx.destroy
    redirect_to user_gpxes_path(current_user), notice: "Your GPX file has been successfully deleted"
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_gpx
      @gpx = Gpx.find(params[:id])
    end

    def gpx_params
      params.require(:gpx).permit(:name, :activity, :file, :user_id)
    end

end

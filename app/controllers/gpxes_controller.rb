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

    if @gpx.save
      redirect_to user_gpxes_path
    else
      redirect_to new_user_gpx_path
    end
  end

  def update
    @gpx.update(gpx_params)
    if @gpx.save
      redirect_to user_gpxes_path(current_user)
    else
      redirect_to edit_gpx_path
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


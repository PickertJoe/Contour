class ElevationGraph < ApplicationRecord

  has_one_attached :image
  has_one_attached :data

  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :x_title
  validates_presence_of :y_title
  validates_presence_of :gpx_id

  enum size: [:small, :medium, :large]

  def zip
    time = gpx.gpx_datum.time.drop(1)
    elevation = gpx.gpx_datum.elevation
    data_frame = time.zip(elevation)
  end
end

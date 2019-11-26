class ElevationGraph < ApplicationRecord

  has_one_attached :image
  has_one_attached :data

  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :x_title
  validates_presence_of :y_title
  validates_presence_of :units
  validates_presence_of :gpx_id

  enum size: [:small, :medium, :large]
  enum units: [:metric, :english]

  def zip
    # There's some fluke in the gpx files where the parsing script in duplicating the first time value
    # Creating uneven array lengths between the time and elevation data
    # This is a stand-in fix until I can figure out what's going on with the parsing function
    time = gpx.gpx_datum.time.drop(1)
    elevation = gpx.gpx_datum.elevation

    # Converting metric elevation units to feet if necesssary
    if units == "english"
      elevation.map! { |i| i * 3.28084 }
    end

    data_frame = time.zip(elevation)
  end
end

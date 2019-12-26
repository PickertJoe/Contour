class ElevationGraph < ApplicationRecord
  has_one_attached :image

  belongs_to :gpx

  # This is a test comment

  validates_presence_of :chart_title
  validates_presence_of :x_title
  validates_presence_of :y_title
  validates_presence_of :units
  validates_presence_of :gpx_id

  enum size: [:small, :medium, :large]
  enum units: [:metric, :english]

  def zip
    # For some reason the gpx files have one more time value than elevation value, leading to uneven array size
    # This is a stand-in fix until I can figure out what's going on with the parsing function
    time = gpx.gpx_datum.time.drop(1)
    elevation = gpx.gpx_datum.elevation

    # Converting metric elevation units to feet if necesssary
    if units == "english"
      elevation.map! { |i| i * 3.28084 }
    end

    data_frame = time.zip(elevation)
  end

  def price
    if size == "small"
      2999
    elsif size == "medium"
      4999
    elsif size == "large"
      6999
    end
  end
end

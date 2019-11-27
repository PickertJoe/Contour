class ElevationGraph < ApplicationRecord
  after_save :set_price

  has_one_attached :image
  has_one :price, as: :priceable, :dependent => :destroy

  belongs_to :gpx

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

  def set_price
    if size == "small"
      self.price = Price.new(value: 2999)
    elsif size == "medium"
      self.price = Price.new(value: 4999)
    elsif size == "large"
      self.price == Price.new(value: 6999)
    end
  end
end

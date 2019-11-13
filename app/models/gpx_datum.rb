class GpxDatum < ApplicationRecord
  belongs_to :gpx

  validates_presence_of :time
  validates_presence_of :elevation
end

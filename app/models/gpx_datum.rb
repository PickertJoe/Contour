class GpxDatum < ApplicationRecord
  belongs_to :gpx
  serialize :time, Array
  serialize :elevation, Array

  validates_presence_of :time
  validates_presence_of :elevation
end

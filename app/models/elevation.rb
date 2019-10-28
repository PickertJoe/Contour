class Elevation < ApplicationRecord
  has_one_attached :file
  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :x_title
  validates_presence_of :y_title
  validates_presence_of :gpx_id

  enum size: ['12"x16"', '18"x24"', '36"x48"']
end

class Topo < ApplicationRecord
  has_one_attached :image
  belongs_to :gpx

  validates_presence_of :file
  validates_presence_of :chart_title
  validates_presence_of :gpx_id

  enum size: ['12"x12"', '24"x24"', '36"x36"']
end

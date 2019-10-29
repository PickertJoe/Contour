class Gpx < ApplicationRecord
  has_one_attached :file
  belongs_to :user
  has_many :elevationgraphs
  has_many :topographicmaps

  validates_presence_of :name
  validates_presence_of :activity
  validates :file, attached: true, content_type: ['application/gpx+xml']

  enum activity: [:hike, :run, :bike, :swim, :ski, :snowboard]

  def gpx_list
    gpx_activity = Gpx.activities.keys.map { |activity| [activity.humanize, activity]}
  end
end

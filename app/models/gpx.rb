class Gpx < ApplicationRecord
  after_create_commit :parse_gpx

  has_one_attached :file
  belongs_to :user
  has_many :elevation_graph
  has_many :topographic_map
  has_one :gpx_datum

  validates_presence_of :name
  validates_presence_of :activity

  validates :file, attached: true, content_type: ['application/gpx+xml']

  enum activity: [:hike, :run, :bike, :swim, :ski, :snowboard]


  def gpx_list
    gpx_activity = Gpx.activities.keys.map { |activity| [activity.humanize, activity]}
  end

  # This method will read the attached .gpx data file and extract the elevation data as a time series
  def parse_gpx
    doc = Nokogiri::XML(file.download)

    # Reading the XML file to pull all data contained in <ele> tags
    elev_array = doc.css("ele").map do |link|
      link.text.to_f
    end

    # Likewise for time data
    time_array = doc.css("time").map do |link|
      # To properly plot the time data in UTC, we have to convert the reported data into milliseconds
      Time.parse(link.text, "DD.MM.YYYY hh:mm:ss").to_i*1000
    end

    self.gpx_datum = GpxDatum.new(elevation: elev_array, time: time_array)
  end
end

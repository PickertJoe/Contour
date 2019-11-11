class ElevationGraph < ApplicationRecord

  has_one_attached :image
  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :x_title
  validates_presence_of :y_title
  validates_presence_of :gpx_id
  validates_presence_of :data

  enum size: [:small, :medium, :large]

  # This method will read the attached .gpx data file and extract the elevation data as a time series
  def parse

    doc = Nokogiri::XML(self.gpx.file.download.to_s)
    elev_array = []
    time_array = []

    # Reading the XML file to pull all data contained in <ele> tags
    doc.css("ele").each do |link|
      elev_array << link.text.to_f
    end

    # Likewise for time data
    doc.css("time").each do |link|
      # To properly plot the time data in UTC, we have to convert the reported data into milliseconds
      time_array << Time.parse(link.text, "DD.MM.YYYY hh:mm:ss").to_i*1000
    end

    # Casting the parsed arrays into Daru Vectors
    elev_vector = Daru::Vector.new(elev_array)
    time_vector = Daru::Vector.new(time_array)

    # Combining the vectors into a single Daru data frame
    elev_df = Daru::DataFrame.new({
      time: time_vector,
      elevation: elev_vector,
    },
      order: [:time, :elevation])
  end

  # This method will create and options hash from the data specified by the user for the plot
  def options

    @opts = {
        chart: {
          defaultSeriesType: 'line'},
        title: {
          text: self.chart_title
          },

        xAxis: {
          title:{
            text: self.x_title
          },
          type: 'datetime'
        },

        yAxis: {
          title: {
            text: self.y_title
          }
        },

        legend:{
          enabled: false
        },
      }
  end
end

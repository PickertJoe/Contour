class ElevationGraph < ApplicationRecord

  has_one_attached :image
  has_one_attached :data

  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :x_title
  validates_presence_of :y_title
  validates_presence_of :gpx_id

  enum size: [:small, :medium, :large]

  def to_daru
    frame = gpx.to_daru
    # operate on that frame
    frame
  end

  # This method will create and options hash from the data specified by the user for the plot
  def options
    {
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

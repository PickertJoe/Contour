class TopographicMap < ApplicationRecord
  has_one_attached :image
  has_one :price, as: :priceable, :dependent => :destroy
  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :gpx_id

  enum size: [:small, :medium, :large]

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

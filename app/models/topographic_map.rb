class TopographicMap < ApplicationRecord
  has_one_attached :image
  has_one :price, as: :priceable
  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :gpx_id

  enum size: [:small, :medium, :large]
end

class TopographicMap < ApplicationRecord
  after_commit :set_price

  has_one_attached :image
  has_one :price, as: :priceable, :dependent => :destroy
  belongs_to :gpx

  validates_presence_of :chart_title
  validates_presence_of :gpx_id

  enum size: [:small, :medium, :large]

  def set_price
    if size == "small"
      self.price = Price.new(value: 29.99)
    elsif size == "medium"
      self.price = Price.new(value: 49.99)
    elsif size == "large"
      self.price == Price.new(value: 69.99)
    end
  end
end

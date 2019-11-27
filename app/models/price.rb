class Price < ApplicationRecord
  belongs_to :priceable, polymorphic: true

  validates_presence_of :value
end

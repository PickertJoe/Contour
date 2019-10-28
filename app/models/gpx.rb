class Gpx < ApplicationRecord
  has_one_attached :file
  belongs_to :user
  has_many :elevations
  has_many :topos

  validates_presence_of :name
  validates_presence_of :activity

  enum activity: [:Hike, :Run, :Bike, :Swim, :Ski, :Snowboard]
end

class Gpx < ApplicationRecord
  has_one_attached :file
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :activity

  enum activity: [:Hike, :Run, :Bike, :Swim, :Ski, :Snowboard]
end

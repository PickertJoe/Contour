class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gpxes
  has_many :elevationgraphs,  through: :gpx
  has_many :topographicmaps,  through: :gpx

  def full_name
    name = first_name.titleize + " " + last_name.titleize
  end
end

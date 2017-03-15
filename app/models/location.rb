class Location < ApplicationRecord
  has_many :appointments
  validates :address, :city, :state, :zip_code, presence: true
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{address}, #{city}, #{state} #{zip_code}"
  end


end

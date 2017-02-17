class Location < ApplicationRecord
  has_many :appointments
  
  validates :address, :city, :state, :zip_code, presence: true
end

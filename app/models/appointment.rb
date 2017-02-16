class Appointment < ApplicationRecord
  belongs_to :location
  has_many :user_appointment
  has_many :users, through: :user_appointment

end

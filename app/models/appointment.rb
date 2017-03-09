class Appointment < ApplicationRecord
  belongs_to :location
  has_many :user_appointment
  has_many :users, through: :user_appointment

  validates  :start_time, :end_time, :title, :date, presence: true

  def formatted_date
    year = date[0..3].to_i
    month = date[5..7].to_i
    day = date[9..11].to_i
    Date.new(year,month,day)
  end

end

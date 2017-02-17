class UserAppointment < ApplicationRecord
  belongs_to :user
  belongs_to :appointment

  validates :user_id, :appointment_id, presence: true
  validates_uniqueness_of :user_id, scope: :appointment_id
end

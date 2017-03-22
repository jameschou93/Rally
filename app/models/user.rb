class User < ApplicationRecord
  has_secure_password 
  has_many :user_appointments
  has_many :appointments, through: :user_appointments
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :messages
  validates :last_name, :first_name, :username, :email, presence: true
  validates :email, :username, uniqueness: true
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

end

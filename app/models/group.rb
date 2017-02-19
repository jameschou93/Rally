class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  
  has_many :group_category
  has_many :categories, through: :group_category

  validates :name, presence: true 
  validates :name, uniqueness: true
end

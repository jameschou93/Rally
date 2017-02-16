class Category < ApplicationRecord
  has_many :group_category
  has_many :groups, through: :group_category

end

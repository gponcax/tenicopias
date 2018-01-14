class Group < ApplicationRecord
  belongs_to :student
  has_many :courses  
  # belongs_to :teacher
  # belongs_to :teacher
end

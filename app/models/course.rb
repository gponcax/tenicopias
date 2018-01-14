class Course < ApplicationRecord
  has_many :docs
  belongs_to :group
  belongs_to :teacher
  # has_many :teachers, through: :groups
  # has_many :students, through: :groups
  # has_many :groups
  #
  # belongs_to :student
end

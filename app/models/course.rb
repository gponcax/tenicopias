class Course < ApplicationRecord
  has_many :teachers, through: :groups
  has_many :students, through: :groups
  has_many :groups
end

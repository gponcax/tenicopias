class Course < ApplicationRecord
  has_many :study_courses
  has_many :teachers, through: :study_courses
  has_many :students, through: :study_courses
end
